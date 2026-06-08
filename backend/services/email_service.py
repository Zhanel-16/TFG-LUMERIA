# from flask_mail import Message
# from extensions import mail
# import os
# # lo hago de esta manera por el circular import, me daba error: 
# # File "C:\Users\zhane\Desktop\TFG-Zhanel\backend\app.py", line 13, in <module>
# #     from routes.appointments import appointments
# # ImportError: cannot import name 'appointments' from partially initialized module 'routes.appointments' (most likely due to a circular import) (C:\Users\zhane\Desktop\TFG-Zhanel\backend\routes\appointments.py)
# # PS C:\Users\zhane\Desktop\TFG-Zhanel\backend> 


# def enviar_confirmacion(destinatario, fecha, hora, notes, interest=""):
#     print("1 - Entrando en enviar_confirmacion")
#     # prueba1
#     msg = Message(
#         "Reserva confirmada | LUMERIA",
#         sender=os.getenv("MAIL_USERNAME"),
#         recipients=[destinatario]
#     )
#     # print("2 - Message creado")
#     msg.body = f"""
# Tu cita privada ha sido confirmada ✨

# Fecha: {fecha}
# Hora: {hora}
# Experiencia reservada: {interest}
# Preferencias para tu experiencia: {notes}

# Será un placer acompañarte en esta experiencia exclusiva, nuestro equipo preparará una selección personalizada según tus preferencias 💎

# Gracias por confiar en LUMERIA, joyería fina diseñada para brillar toda la vida 💛
# """

#     print("3 - Antes de mail.send")
    
#     try:
#         mail.send(msg)
#         print("4 - Email enviado OK")
#     except Exception as e:
#         print("ERROR enviando email:", e)

  
    
# print("MAIL USER:", os.getenv("MAIL_USERNAME"))
# print("MAIL PASS EXISTS:", bool(os.getenv("MAIL_PASSWORD")))



import os
import resend

resend.api_key = os.getenv("RESEND_API_KEY")

def enviar_confirmacion(destinatario, fecha, hora, notes, interest=""):
    if interest == "Anillos de compromiso":
        texto_notas = notes
    else:
        texto_notas = f"Preferencias para tu experiencia:\n\n{notes}"

    resend.Emails.send({
        "from": "LUMERIA <onboarding@resend.dev>",
        "to": [destinatario],
        "subject": "Reserva confirmada | LUMERIA",
        "text": f"""
Tu cita privada ha sido confirmada ✨

Fecha: {fecha}
Hora: {hora}
Experiencia reservada: {interest}

{texto_notas}

Será un placer acompañarte en esta experiencia exclusiva, nuestro equipo preparará una selección personalizada según tus preferencias 💎

Gracias por confiar en LUMERIA, joyería fina diseñada para brillar toda la vida 💛
"""
        })

    #     print("4 - Email enviado OK")

    # except Exception as e:
    #     print("ERROR enviando email:", e)