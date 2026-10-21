import sqlite3
from typing import List, Dict, Any, Optional

class UserRepository:
    """Repositório responsável pelas operações de persistência do usuário."""

    def __init__(self, db_connection: sqlite3.Connection):
        self.conn = db_connection

    def create(self, username: str, password_hash: str, created_at: str) -> int:
        cursor = self.conn.cursor()
        cursor.execute(
            "INSERT INTO users (username, password, created_at) VALUES (?, ?, ?)",
            (username, password_hash, created_at)
        )
        self.conn.commit()
        return cursor.lastrowid

    def search_by_username(self, username: str) -> List[Dict[str, Any]]:
        cursor = self.conn.cursor()
        cursor.execute(
            "SELECT id, username, created_at FROM users WHERE username LIKE ?",
            (f"%{username}%",)
        )
        rows = cursor.fetchall()
        return [dict(row) for row in rows]

    def exists_by_username(self, username: str) -> bool:
        cursor = self.conn.cursor()
        cursor.execute("SELECT 1 FROM users WHERE username = ?", (username,))
        return cursor.fetchone() is not None