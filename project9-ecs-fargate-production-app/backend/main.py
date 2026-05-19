import os
import time
import psycopg2
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")


class TaskCreate(BaseModel):
    title: str


def get_connection():
    return psycopg2.connect(DATABASE_URL)


def init_db():
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
    try:
        conn = get_connection()
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        cur.close()
        conn.close()
        return {"status": "healthy", "database": "connected"}
    except Exception:
        return {"status": "unhealthy", "database": "disconnected"}


@app.get("/api/tasks")
def get_tasks():
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
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO tasks (title) VALUES (%s);", (task.title,))
    conn.commit()
    cur.close()
    conn.close()

    return {"message": "task created", "title": task.title}
