import os
import psycopg2
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

DATABASE_URL = os.getenv("DATABASE_URL")


class Task(BaseModel):
    title: str


def get_connection():
    return psycopg2.connect(DATABASE_URL)


def init_db():
    if not DATABASE_URL:
        return

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


@app.on_event("startup")
def startup():
    init_db()


@app.get("/api/health")
def health():
    try:
        if DATABASE_URL:
            conn = get_connection()
            conn.close()
            return {"status": "healthy", "database": "connected"}
        return {"status": "healthy", "database": "not configured"}
    except Exception as e:
        return {"status": "unhealthy", "error": str(e)}


@app.get("/api/tasks")
def get_tasks():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, title FROM tasks ORDER BY id DESC;")
    rows = cur.fetchall()
    cur.close()
    conn.close()

    return [{"id": row[0], "title": row[1]} for row in rows]


@app.post("/api/tasks")
def add_task(task: Task):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO tasks (title) VALUES (%s) RETURNING id;", (task.title,))
    task_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()

    return {"id": task_id, "title": task.title}
