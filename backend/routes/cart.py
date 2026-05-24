from flask import Blueprint, request, jsonify
from bd.bd import db_conn
cart = Blueprint("cart", __name__)

@cart.route("/cart/<user_id>")
def get_cart(user_id):
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT products.*, cart.quantity
        FROM cart JOIN products ON products.id = cart.product_id
        WHERE cart.user_id=%s
    """,(user_id,))

    items = cursor.fetchall()
    return jsonify(items)

@cart.route("/cart", methods=["POST"])
def add_cart():
    data = request.json
    conn = db_conn()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO cart(user_id,product_id,quantity)
        VALUES(%s,%s,1)
    """,(data["user_id"],data["product_id"]))
    conn.commit()
    return jsonify({"message":"Añadido al carrito"})