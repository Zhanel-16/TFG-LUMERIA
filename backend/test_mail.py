import os
import smtplib
from dotenv import load_dotenv

load_dotenv()

def test_smtp():
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587, timeout=10)
        server.starttls()
        server.login(os.getenv("MAIL_USERNAME"), os.getenv("MAIL_PASSWORD"))
        print("SMTP OK")
        server.quit()
    except Exception as e:
        print("SMTP ERROR:", e)

if __name__ == "__main__":
    test_smtp()