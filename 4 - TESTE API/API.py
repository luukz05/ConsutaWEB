import mysql.connector
from flask import Flask, jsonify, request
from flask_cors import CORS
import os
from dotenv import load_dotenv

load_dotenv()

def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
app = Flask(__name__)
CORS(app)

@app.route('/rand', methods=['GET'])
def rand():
    try:
        with get_db_connection() as con, con.cursor(dictionary=True) as cursor:
            cursor.execute("SELECT * FROM RELATORIO_CADOP ORDER BY RAND() LIMIT 1;")
            return jsonify(cursor.fetchall() or {"message": "nenhum dado encontrado"})
    except mysql.connector.Error as e:
        return jsonify({"error": str(e)}), 500

@app.route('/consulta/', methods=['GET'])
def consulta():
    nome_busca = request.args.get('nome_busca')
    if not nome_busca:
        return jsonify({"error": "'nome_busca' é obrigatório"}), 400
    try:
        with get_db_connection() as con, con.cursor(dictionary=True) as cursor:
            cursor.execute("SELECT * FROM RELATORIO_CADOP WHERE Nome_Fantasia LIKE CONCAT('%', %s, '%');", (nome_busca,))
            return jsonify(cursor.fetchall() or {"message": "nenhum dado encontrado"})
    except mysql.connector.Error as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=os.getenv("FLASK_DEBUG", "false").lower() == "true")
