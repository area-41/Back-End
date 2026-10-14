from flask import Blueprint, jsonify, Response
from services.post_service import PostService

users_bp = Blueprint("users", __name__, url_prefix="/users")
post_service = PostService()

@users_bp.route("/<string:username>/posts", methods=["GET"])
def get_user_posts(username: str) -> tuple[Response, int]:
    posts = post_service.get_by_author(username)
    return jsonify({"username": username, "data": posts, "count": len(posts)}), 200