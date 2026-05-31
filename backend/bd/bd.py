import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()

def db_conn():
    conn = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASS"),
        database=os.getenv("MYSQL_BD"),
        charset="utf8mb4",
        use_unicode=True,
        autocommit=True
    )

    cursor = conn.cursor()
    cursor.execute("SET NAMES utf8mb4 COLLATE utf8mb4_general_ci")
    cursor.close()

    return conn