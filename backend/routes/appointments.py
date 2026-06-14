from flask import Blueprint, request, jsonify
# import threading
from bd.bd import db_conn
from services.google_calendar import create_calendar_event
from services.email_service import enviar_confirmacion

appointments = Blueprint("appointments", __name__)

# EMAIL THREAD FUNCTION
# def send_email(app, data):
#     with app.app_context():
#         try:
#             enviar_confirmacion(
#                 data["email"],
#                 data["date"],
#                 data["time"],
#                 data["notes"],
#                 data["interest"]
#             )
#         except Exception as e:
#             print("EMAIL ERROR:", e)

@appointments.route("/", methods=["POST"])
def create_appointment():
    try:
        data = request.get_json()

        # VALIDACIONES 
        if not data.get("user_id"):
            return jsonify({"ok": False, "error": "Usuario no autenticado"}), 401

        if not data.get("date") or not data.get("time") or not data.get("email"):
            return jsonify({"ok": False, "error": "Faltan campos obligatorios"}), 400

        conn = db_conn()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO appointments (user_id,date,time,interest,notes,proposalDate,giftEligible,giftStatus,service)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """, (
            data["user_id"],
            data["date"],
            data["time"],
            data["interest"],
            data["notes"],
            data.get("proposalDate"),
            data.get("giftEligible", False),
            data.get("giftStatus"),
            data["service"]
        ))

        conn.commit()
        cursor.close()
        conn.close()

        # GOOGLE CALENDAR (sync)
        create_calendar_event(
            data["date"],
            data["time"],
            data["service"]
        )

        # EMAIL (ASYNC - CLAVE)
        # threading.Thread(
        #     target=send_email,
        #     args=(current_app._get_current_object(), data),
        #     daemon=True
        # ).start()
        enviar_confirmacion(
            data["email"],
            data["date"],
            data["time"],
            data["notes"],
            data["interest"]
        )

        return jsonify({
            "ok": True,
            "msg": "Cita reservada correctamente"
        })

    except Exception as e:
        print("APPOINTMENT ERROR:", e)
        return jsonify({"ok": False, "error": str(e)})
    
# arreglo de: WORKER TIMEOUT, bloqueo de SMTP
# Flask responde rapido, no hay timeout

# ruta para citas privadas 
# @appointments.route("/user/<uid>", methods=["GET"])
# def get_user_appointment(uid):

#     conn = db_conn()
#     cursor = conn.cursor(dictionary=True)

#     cursor.execute("""
#         SELECT *
#         FROM appointments
#         WHERE user_id = %s
#         AND service = 'Engagement Concierge'
#         LIMIT 1
#     """, (uid,))

#     cita = cursor.fetchone()

#     cursor.close()
#     conn.close()

#     return jsonify(cita)

@appointments.route("/user/<uid>", methods=["GET"])
def get_user_appointment(uid):
    try:
        # print("UID recibido:", uid)

        conn = db_conn()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT *
            FROM appointments
            WHERE user_id = %s
            AND service = %s
            LIMIT 1
        """, (uid, "Engagement Concierge"))

        cita = cursor.fetchone()
        # print("CITA:", cita)
        if cita: #transform los campos antes de devolver
            # asi evito error TypeError: Object of type timedelta is not JSON serializable 
            cita["time"] = str(cita["time"])
            cita["date"] = str(cita["date"])
            cita["proposalDate"] = str(cita["proposalDate"]) if cita["proposalDate"] else None
            cita["created_at"] = str(cita["created_at"])

        cursor.close()
        conn.close()

        return jsonify(cita)

    except Exception as e:
        print("ERROR GET APPOINTMENT:", e)
        return jsonify({"error": str(e)}), 500