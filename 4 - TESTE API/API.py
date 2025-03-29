import mysql.connector
from mysql.connector import Error
from flask import Flask, jsonify
from flask_cors import CORS


app = Flask(__name__)
CORS(app)

@app.route('/rand')
def rand():
    try:
        con = mysql.connector.connect(host='localhost', database='ANS', user='lucas', password='123321')

        if con.is_connected():
            db_info = con.get_server_info()
            print(f"Conectado ao servidor MySQL versão {db_info}")
            cursor = con.cursor()
            cursor.execute("SELECT * FROM RELATORIO_CADOP ORDER BY RAND() LIMIT 1;")
            linhas = cursor.fetchall()
            print(f"Todas as linhas retornadas: {linhas}")

            if linhas:
                return jsonify(linhas)
            else:
                return jsonify({"message": "Nenhum dado encontrado"}), 404

    except Error as e:
        print(f"Erro ao acessar o banco de dados: {e}")
        return jsonify({"error": f"Erro ao acessar o banco de dados: {str(e)}"}), 500

    except Exception as e:
        print(f"Erro inesperado: {e}")
        return jsonify({"error": f"Erro inesperado: {str(e)}"}), 500

    finally:
        if con.is_connected():
            cursor.close()
            con.close()
            print("Conexão ao banco de dados encerrada.")


if __name__ == '__main__':
    app.run(debug=True)
