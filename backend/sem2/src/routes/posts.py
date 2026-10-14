from flask import Blueprint, jsonify, Response
from services.post_service import PostService

posts_bp = Blueprint("posts", __name__, url_prefix="/posts")
post_service = PostService()

@posts_bp.route("", methods=["GET"])
def get_posts() -> tuple[Response, int]:
    posts = post_service.list_all()
    return jsonify({"data": posts, "count": len(posts)}), 200

@posts_bp.route("/<int:post_id>", methods=["GET"])
def get_post_detail(post_id: int) -> tuple[Response, int]:
    post = post_service.get_by_id(post_id)
    if not post:
        return jsonify({"error": "NOT_FOUND", "message": f"Post {post_id} não encontrado."}), 404
    return jsonify({"data": post}), 200