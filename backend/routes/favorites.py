from flask import Blueprint, request, jsonify
from bd.bd import db_conn
favorites = Blueprint("favorites", __name__)

@favorites.route("/favorites/<user_id>")
def get_favorites(user_id):
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT products.* FROM favorites
        JOIN products ON products.id = favorites.product_id
        WHERE favorites.user_id=%s
    """,(user_id,))

    favs = cursor.fetchall()
    return jsonify(favs)

@favorites.route("/favorites", methods=["POST"])
def add_favorite():
    data = request.json
    conn = db_conn()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO favorites(user_id,product_id) VALUES(%s,%s)",
                   (data["user_id"], data["product_id"]))
    conn.commit()

    return jsonify({"message":"Añadido a favoritos"})