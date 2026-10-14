from typing import Dict, List, Optional

class UserService:
    def __init__(self) -> None:
        # Simulação de repositório/banco de dados de usuários
        self._users: List[Dict[str, str | int]] = [
            {
                "id": 1,
                "username": "victor",
                "name": "Victor Marques",
                "email": "victor@example.com",
                "role": "Data Engineer"
            },
            {
                "id": 2,
                "username": "ana",
                "name": "Ana Silva",
                "email": "ana@example.com",
                "role": "Backend Developer"
            }
        ]

    def list_all(self) -> List[Dict[str, str | int]]:
        """Retorna todos os usuários cadastrados."""
        return self._users

    def get_by_username(self, username: str) -> Optional[Dict[str, str | int]]:
        """Busca os detalhes do perfil de um usuário pelo seu username."""
        return next(
            (user for user in self._users if user["username"].lower() == username.lower()),
            None
        )