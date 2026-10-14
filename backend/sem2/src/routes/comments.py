from flask import Blueprint, jsonify, Response
from services.comment_service import CommentService

comments_bp = Blueprint("comments", __name__, url_prefix="/comments")
comment_service = CommentService()

@comments_bp.route("", methods=["GET"])
def get_comments() -> tuple[Response, int]:
    comments = comment_service.list_all()
    return jsonify({"data": comments, "count": len(comments)}), 200

@comments_bp.route("/<string:comment_id>", methods=["GET"])
def get_comment_detail(comment_id: str) -> tuple[Response, int]:
    comment = comment_service.get_by_id(comment_id)
    if not comment:
        return jsonify({"error": "NOT_FOUND", "message": f"Comentário {comment_id} não encontrado."}), 404
    return jsonify({"data": comment}), 200