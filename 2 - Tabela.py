import pdfplumber
import pandas as pd

caminho_pdf = "C:/Users/eusou/PycharmProjects/pythonProject/.venv/pdfs/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"

dados = []
colunas = None

with pdfplumber.open(caminho_pdf) as pdf:
    for pagina in pdf.pages[2:182]:  # pg de 2 a 181
        tabela = pagina.extract_table()
        if tabela:
            for linha in tabela:
                linha = [cell.replace('\n', ' ').strip() if cell else '' for cell in linha]
                if colunas is None:
                    colunas = linha
                elif linha != colunas:
                    dados.append(linha)

if dados:
    pd.DataFrame(dados, columns=colunas).to_csv("tabela.csv", index=False, encoding="utf-8-sig", sep=';')
    print("CSV criado com sucesso!")
else:
    print("Nenhuma tabela encontrada.")
