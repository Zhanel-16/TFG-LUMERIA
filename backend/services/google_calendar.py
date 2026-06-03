from google.oauth2 import service_account
from googleapiclient.discovery import build
from datetime import datetime, timedelta
# cambios: 5 y 6 
import os
import json

SCOPES = ['https://www.googleapis.com/auth/calendar']

def create_calendar_event(date, time, servicio):

    # lo comento ya q no lo encuentra (archivo oculto)
    # credentials = service_account.Credentials.from_service_account_file(
    #     "google_credentials.json", 
    #     scopes=SCOPES
    # )
    credentials_info = json.loads( #nueva var para sacar el valor con os del json oculto
        os.environ["GOOGLE_CREDENTIALS"]
    )
    credentials = service_account.Credentials.from_service_account_info(
        credentials_info,
        scopes=SCOPES
    )
    # y en render crear una var entorno nueva GOOGLE_CREDENTIALS = valor tal cual del json oculto 

    service = build("calendar", "v3", credentials=credentials)

    start_datetime = datetime.strptime(
        f"{date} {time}",
        "%Y-%m-%d %H:%M"
    )

    end_datetime = start_datetime + timedelta(hours=1)

    event = {
        "summary": f"Private Experience - {servicio}",

        "start": {
            "dateTime": start_datetime.isoformat(),
            "timeZone": "Europe/Madrid",
        },

        "end": {
            "dateTime": end_datetime.isoformat(),
            "timeZone": "Europe/Madrid",
        },
    }

    service.events().insert(
        calendarId="primary",
        body=event
    ).execute()