from flask import Blueprint, jsonify, Response

health_bp = Blueprint("health", __name__)

@health_bp.route("/healthz", methods=["GET"])
def health_check() -> tuple[Response, int]:
    """Endpoint de verificação de integridade (Liveness Probe para Kubernetes)."""
    return jsonify({"status": "UP", "service": "social-api"}), 200