from flask import Blueprint, request, jsonify
from bd.bd import db_conn
from services.google_calendar import create_calendar_event
from services.email_service import enviar_confirmacion

appointments = Blueprint("appointments", __name__)
#CREAR CITA
@appointments.route("/", methods=["POST"])
def create_appointment():
    try:
        data = request.get_json()
        # añadi eso 25/05 para proteger
        if not data.get("user_id"):
            return jsonify({
                "ok": False,
                "error": "Usuario no autenticado"
            }), 401
        # añadi eso 25/05 para proteger; evita: POST manual, peticiones falsas, reservas sin login
        if (not data.get("date") or not data.get("time") or not data.get("email")):
            # por si falta algun campo q no se rompa pero q diga --> "error": "Faltan campos obligatorios"
            return jsonify({
                "ok": False,
                "error": "Faltan campos obligatorios"
            }), 400   
        conn = db_conn()
        cursor = conn.cursor()

        cursor.execute("""INSERT INTO appointments (user_id,date,time,interest,notes) VALUES (%s,%s,%s,%s,%s)""",
            (
                data["user_id"],
                data["date"],
                data["time"],
                data["interest"],
                data["notes"]
                # me sirve para: Private Experience, Engagement Concierge, cualquier formulario de citas GC 
            )
        )
        conn.commit()
        cursor.close()
        conn.close()
        # GOOGLE CALENDAR + correo autom
        create_calendar_event(
            data["date"],
            data["time"],
            data["service"])
        
        enviar_confirmacion(
            data["email"],
            data["date"],
            data["time"],
            data["notes"],
            data["interest"])
        return jsonify({
            "ok": True,
            "msg": "Cita reservada correctamente"})

    except Exception as error:
        print(error)
        return jsonify({
            "ok": False,
            "error": str(error)})
        
# VER CITAS
# antes tenía eso: @appointments.route("/<int:user_id>") INT pero en bd lo cambie a varchar de 255 asi q:
@appointments.route("/<user_id>")
def get_appointments(user_id):
    conn = db_conn()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM appointments WHERE user_id=%s", (user_id,))

    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(data)