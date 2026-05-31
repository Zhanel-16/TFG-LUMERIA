from flask import Blueprint, jsonify
from bd.bd import db_conn

from flask import request


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


@products.route("/db-check")
def db_check():
    try:
        conn = db_conn()
        cursor = conn.cursor()

        cursor.execute("SELECT DATABASE()")
        db = cursor.fetchone()

        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        return {
            "database": db,
            "tables": tables
        }

    except Exception as e:
        return {"error": str(e)}

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

@products.route("/search")
def search_products():

    q = request.args.get("q", "")

    conn = db_conn()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT * FROM products
        WHERE
            name LIKE %s
            OR category LIKE %s
            OR color_oro LIKE %s
            OR description LIKE %s
    """, (
        f"%{q}%",
        f"%{q}%",
        f"%{q}%",
        f"%{q}%"
    ))

    results = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(results)

@products.route("/ping", methods=["GET"])
def ping():
    return {"ok": True}

