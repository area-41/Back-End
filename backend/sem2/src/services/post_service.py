# src/services/post_service.py
from typing import Dict, List, Optional

class PostService:
    def __init__(self) -> None:
        # Simulação de repositório/banco de dados
        self._posts: List[Dict[str, str | int]] = [
            {"id": 101, "title": "Arquitetura Escalável em Flask", "author": "victor"},
            {"id": 102, "title": "MLOps na Prática com Docker", "author": "victor"}
        ]

    def list_all(self) -> List[Dict[str, str | int]]:
        return self._posts

    def get_by_id(self, post_id: int) -> Optional[Dict[str, str | int]]:
        return next((post for post in self._posts if post["id"] == post_id), None)

    def get_by_author(self, username: str) -> List[Dict[str, str | int]]:
        return [post for post in self._posts if post["author"].lower() == username.lower()]