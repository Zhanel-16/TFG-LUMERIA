from google.oauth2 import service_account
from googleapiclient.discovery import build
from datetime import datetime, timedelta

SCOPES = ['https://www.googleapis.com/auth/calendar']

def create_calendar_event(date, time, servicio):

    credentials = service_account.Credentials.from_service_account_file(
        "google_credentials.json",
        scopes=SCOPES
    )

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