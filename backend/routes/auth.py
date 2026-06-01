from flask import Blueprint, request, jsonify
from bd.bd import db_conn
from werkzeug.security import generate_password_hash, check_password_hash
import jwt, datetime, os
auth = Blueprint("auth", __name__)

from dotenv import load_dotenv
load_dotenv()
SECRET = os.getenv("SECRET_KEY")
#JWT usa el valor de var SECRET, se necesita --> cadena secreta privada para firmar tokens
@auth.route("/register", methods=["POST"])
def register():
    data = request.json
    email = data["email"]
    password = generate_password_hash(data["password"])

    conn = db_conn()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users(email,password) VALUES(%s,%s)",(email,password))
    conn.commit()

    cursor.close()
    conn.close()
    return jsonify({"message":"Usuario creado"})

@auth.route("/login", methods=["POST"])
def login():
    data = request.json

    conn = db_conn()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE email=%s",(data["email"],))
    user = cursor.fetchone()

    if not user or not check_password_hash(user["password"], data["password"]):
        return jsonify({"error":"Credenciales incorrectas"}),401

    token = jwt.encode({
        "user_id": user["id"],
        "exp": datetime.datetime.utcnow() + datetime.timedelta(days=1)
    }, SECRET)

    return jsonify({"token": token})