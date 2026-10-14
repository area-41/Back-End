# src/services/comment_service.py
from typing import Dict, List, Optional

class CommentService:
    def __init__(self) -> None:
        self._comments: List[Dict[str, str | int]] = [
            {"id": "c1001", "post_id": 101, "content": "Excelente estrutura de código!"},
            {"id": "c1002", "post_id": 101, "content": "Muito bom o padrão com Blueprints."}
        ]

    def list_all(self) -> List[Dict[str, str | int]]:
        return self._comments

    def get_by_id(self, comment_id: str) -> Optional[Dict[str, str | int]]:
        return next((comment for comment in self._comments if comment["id"] == comment_id), None)