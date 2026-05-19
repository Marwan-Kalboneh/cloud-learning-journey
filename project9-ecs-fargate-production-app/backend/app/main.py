import os
import time
import psycopg2
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")
memory_tasks = []


class TaskCreate(BaseModel):
    title: str


def database_enabled():
    return DATABASE_URL is not None and DATABASE_URL.strip() != ""


def get_connection():
    return psycopg2.connect(DATABASE_URL)


def init_db():
    if not database_enabled():
        return

    for _ in range(10):
        try:
            conn = get_connection()
            cur = conn.cursor()
            cur.execute("""
                CREATE TABLE IF NOT EXISTS tasks (
                    id SERIAL PRIMARY KEY,
                    title TEXT NOT NULL
                );
            """)
            conn.commit()
            cur.close()
            conn.close()
            return
        except Exception:
            time.sleep(2)

    raise Exception("Database connection failed after retries")


@app.on_event("startup")
def startup_event():
    init_db()


@app.get("/api/health")
def health_check():
    if not database_enabled():
        return {
            "status": "healthy",
            "database": "not configured",
            "mode": "memory"
        }

    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        cur.close()
        conn.close()
        return {
            "status": "healthy",
            "database": "connected",
            "mode": "postgres"
        }
    except Exception:
        return {
            "status": "unhealthy",
            "database": "disconnected",
            "mode": "postgres"
        }


@app.get("/api/tasks")
def get_tasks():
    if not database_enabled():
        return {"tasks": memory_tasks}

    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, title FROM tasks ORDER BY id DESC;")
    rows = cur.fetchall()
    cur.close()
    conn.close()

    return {
        "tasks": [
            {"id": row[0], "title": row[1]}
            for row in rows
        ]
    }


@app.post("/api/tasks")
def create_task(task: TaskCreate):
    if not database_enabled():
        new_task = {
            "id": len(memory_tasks) + 1,
            "title": task.title
        }
        memory_tasks.insert(0, new_task)
        return {"message": "task created", "title": task.title, "mode": "memory"}

    conn = get_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO tasks (title) VALUES (%s);", (task.title,))
    conn.commit()
    cur.close()
    conn.close()

    return {"message": "task created", "title": task.title, "mode": "postgres"}
