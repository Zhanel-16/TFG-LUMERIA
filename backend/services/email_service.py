from flask_mail import Message
from extensions import mail
import os
# lo hago de esta manera por el circular import, me daba error: 
# File "C:\Users\zhane\Desktop\TFG-Zhanel\backend\app.py", line 13, in <module>
#     from routes.appointments import appointments
# ImportError: cannot import name 'appointments' from partially initialized module 'routes.appointments' (most likely due to a circular import) (C:\Users\zhane\Desktop\TFG-Zhanel\backend\routes\appointments.py)
# PS C:\Users\zhane\Desktop\TFG-Zhanel\backend> 

def enviar_confirmacion(destinatario, fecha, hora, notes, interest=""):
    msg = Message(
        "Reserva confirmada | LUMERIA",
        sender=os.getenv("MAIL_USERNAME"),
        recipients=[destinatario]
    )
    msg.body = f"""
Tu cita privada ha sido confirmada ✨

Fecha: {fecha}
Hora: {hora}
Experiencia reservada: {interest}
Preferencias para tu experiencia: {notes}

Será un placer acompañarte en esta experiencia exclusiva, nuestro equipo preparará una selección personalizada según tus preferencias 💎

Gracias por confiar en LUMERIA, joyería fina diseñada para brillar toda la vida 💛
"""

    mail.send(msg)