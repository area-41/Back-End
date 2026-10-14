from flask import Flask


def create_app() -> Flask:
    app = Flask(__name__)

    # Importação corrigida apontando direto para a estrutura interna
    from app.routes.main import main_bp

    app.register_blueprint(main_bp)

    return app