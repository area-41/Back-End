import logging
from flask import Flask, jsonify, Response

from routes.health import health_bp
from routes.posts import posts_bp
from routes.comments import comments_bp
from routes.users import users_bp

def create_app() -> Flask:
    app = Flask(__name__)

    # Mantém os caracteres acentuados legíveis no JSON de resposta
    app.config['RESTFUL_JSON'] = {'ensure_ascii': False}
    app.json.ensure_ascii = False  # Para versões recentes do Flask (2.3+)
    
    # Configuração de Logs Estruturados
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
    )

    # Registro de Blueprints
    app.register_blueprint(health_bp)
    app.register_blueprint(posts_bp)
    app.register_blueprint(comments_bp)
    app.register_blueprint(users_bp)

    # Handler Global de Erro 404 (JSON RESTful)
    @app.errorhandler(404)
    def handle_not_found(error) -> tuple[Response, int]:
        return jsonify({
            "error": "RESOURCE_NOT_FOUND",
            "message": "A URL/Recurso solicitado não foi localizado nesta API."
        }), 404

    # Handler Global de Erro 500
    @app.errorhandler(Exception)
    def handle_internal_error(error) -> tuple[Response, int]:
        app.logger.error(f"Unhandled Exception: {str(error)}", exc_info=True)
        return jsonify({
            "error": "INTERNAL_SERVER_ERROR",
            "message": "Ocorreu um erro interno no servidor."
        }), 500

    return app

if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0", port=8000, debug=True)