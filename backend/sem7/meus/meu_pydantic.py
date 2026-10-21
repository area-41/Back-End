from flask import Flask, request, jsonify
from pydantic import BaseModel, Field, ValidationError

# A variável OBRIGA TARIAMENTE precisa se chamar 'app'
app = Flask(__name__)

class UserSchema(BaseModel):
    username: str = Field(..., min_length=3)
    password: str = Field(..., min_length=6)

@app.route('/test-pydantic', methods=['POST'])
def test_pydantic():
    try:
        data = UserSchema(**request.get_json())
        return jsonify({"message": "Dados válidos!", "data": data.model_dump()}), 200
    except ValidationError as e:
        return jsonify({"error": "Erro de validação", "details": e.errors()}), 400