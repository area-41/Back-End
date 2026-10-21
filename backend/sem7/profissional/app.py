import sqlite3
from flask import Flask, jsonify
from flask_pydantic import validate
from werkzeug.security import generate_password_hash

from database import get_db, close_db
from repositories.user_repository import UserRepository
from schemas.user_schema import UserQuerySchema, UserCreateSchema, UserResponseSchema

app = Flask(__name__)
app.teardown_appcontext(close_db)

# --- TRATAMENTO GLOBAL DE EXCEÇÕES ---

@app.errorhandler(sqlite3.IntegrityError)
def handle_integrity_error(error):
    """Trata conflitos de banco de dados (ex: username duplicado)."""
    return jsonify({
        "error": "Conflict",
        "message": "O username informado já está em uso."
    }), 409

@app.errorhandler(Exception)
def handle_generic_error(error):
    """Trata erros genéricos não capturados."""
    return jsonify({
        "error": "Internal Server Error",
        "message": str(error)
    }), 500


# --- ROTAS DA API ---

@app.route('/users', methods=['GET'])
@validate()
def get_users(query: UserQuerySchema):
    """Busca usuários por parte do nome (Query Param: ?username=termo)."""
    repo = UserRepository(get_db())
    users = repo.search_by_username(query.username)
    return jsonify({"count": len(users), "users": users}), 200


@app.route('/users', methods=['POST'])
@validate()
def create_user(body: UserCreateSchema):
    """Cadastra um novo usuário com senha criptografada (Body JSON)."""
    repo = UserRepository(get_db())

    # Criptografia de senha para produção
    hashed_password = generate_password_hash(body.password)
    created_at_str = body.created_at.isoformat()

    user_id = repo.create(
        username=body.username,
        password_hash=hashed_password,
        created_at=created_at_str
    )

    return jsonify({
        "message": "Usuário criado com sucesso",
        "user_id": user_id
    }), 201


if __name__ == '__main__':
    app.run(port=3000, debug=True)