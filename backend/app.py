from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv #pip install python-dotenv
import os

from routes.products import products
from routes.blog import blog
from routes.contact import contact
from routes.auth import auth
from routes.favorites import favorites
from routes.cart import cart
from routes.appointments import appointments
from flask_mail import Mail #correo autom

app = Flask(__name__)
app.json.ensure_ascii = False
load_dotenv() 
#para mandar correo
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True

app.config['MAIL_USERNAME'] = os.getenv("MAIL_USERNAME")
app.config['MAIL_PASSWORD'] = os.getenv("MAIL_PASSWORD")

# mail = Mail(app) #error del circular import ???
from extensions import mail

mail.init_app(app)
CORS(app)

@app.route("/")
def home():
    return {"message": "API running"} #prueba en /

app.register_blueprint(products, url_prefix="/products")
app.register_blueprint(blog)
app.register_blueprint(contact)
app.register_blueprint(auth)
app.register_blueprint(favorites)
app.register_blueprint(cart)
app.register_blueprint(appointments, url_prefix="/appointments")

if __name__ == "__main__":
    app.run(debug=True)