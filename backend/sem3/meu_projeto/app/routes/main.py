from typing import Any, Dict
from flask import Blueprint, render_template

main_bp = Blueprint("main", __name__)


@main_bp.route("/")
def home() -> str:
    """Página inicial."""
    return render_template("home.html")


@main_bp.route("/about")
def about() -> str:
    """Página sobre com dados do usuário e produtos."""
    context: Dict[str, Any] = {
        "username": "John Doe",
        "age": 30,
        "products": ["Laptop", "Smartphone", "Tablet"],
    }
    return render_template("about.html", **context)