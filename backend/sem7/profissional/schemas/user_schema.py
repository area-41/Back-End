from datetime import datetime
from pydantic import BaseModel, Field

class UserQuerySchema(BaseModel):
    username: str = Field(..., min_length=1, description="Termo de busca para o username")

class UserCreateSchema(BaseModel):
    username: str = Field(..., min_length=3, max_length=50, description="Nome de usuário único")
    password: str = Field(..., min_length=6, description="Senha do usuário")
    created_at: datetime = Field(default_factory=datetime.utcnow)

class UserResponseSchema(BaseModel):
    id: int
    username: str
    created_at: str