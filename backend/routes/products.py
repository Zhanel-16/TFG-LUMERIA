from flask import Blueprint, jsonify
from bd.bd import db_conn

products = Blueprint("products", __name__)
# main /
@products.route("/", methods=["GET"])
def get_products():
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products")
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(data)

# PRODUCTO INDIVIDUAL --> detalles
@products.route("/<int:id>", methods=["GET"])
def get_product(id):
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM products WHERE id=%s", (id,))
    data = cursor.fetchone()
    cursor.close()
    conn.close()
    return jsonify(data)