from flask import Blueprint, jsonify
from bd.bd import db_conn

blog = Blueprint("blog", __name__)

@blog.route("/posts")
def get_posts():
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""SELECT id,title,slug,image,excerpt,created_at FROM posts ORDER BY created_at DESC""")
    posts = cursor.fetchall()

    return jsonify(posts)

@blog.route("/post/<slug>")
def get_post(slug):
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM posts WHERE slug=%s",(slug,))
    post = cursor.fetchone()

    return jsonify(post)