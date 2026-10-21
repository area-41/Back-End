from flask import Flask, jsonify
from werkzeug.exceptions import HTTPException

app = Flask(__name__)

# --- MANIPULADORES DE EXCEÇÃO (ERROR HANDLERS) ---

@app.errorhandler(HTTPException)
def handle_http_exception(e):
    """Trata erros HTTP padrão (ex: 404 Not Found)."""
    return jsonify({
        "code": e.code,
        "error": e.name,
        "message": e.description
    }), e.code

@app.errorhandler(Exception)
def handle_generic_exception(e):
    """Trata erros internos não mapeados (Erro 500)."""
    return jsonify({
        "code": 500,
        "error": "Internal Server Error",
        "message": "Ocorreu um erro interno inesperado no servidor."
    }), 500


# --- ROTAS DE TESTE ---

@app.route('/erro-interno', methods=['GET'])
def erro_interno_teste():
    """Força um erro interno (divisão por zero) para testar o handler 500."""
    resultado = 10 / 0  # Lança ZeroDivisionError
    return jsonify({"resultado": resultado})


@app.route('/processar', methods=['POST'])
def processar():
    """Exemplo de rota para processamento."""
    return jsonify({"message": "Processado com sucesso!"}), 200