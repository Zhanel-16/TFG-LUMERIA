from flask import Blueprint, request, jsonify
from bd.bd import db_conn

contact = Blueprint("contact", __name__)

@contact.route("/contact", methods=["POST"])
def send_contact():
    data = request.json
    conn = db_conn()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO contacts(name,email,message)
        VALUES(%s,%s,%s)
    """,(data["name"],data["email"],data["message"]))

    conn.commit()
    return jsonify({"message":"Mensaje enviado"})