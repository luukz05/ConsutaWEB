from os import error

import pdfplumber
import pandas as pd

caminho_pdf = r"./pdfs/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"

dados = []
colunas = None

with pdfplumber.open(caminho_pdf) as pdf:
    for pagina in pdf.pages[2:181]:  # pg de 2 a 181
        tabela = pagina.extract_table()
        if tabela:
            for linha in tabela:
                linha = [cell.replace('\n', ' ').strip() if cell else '' for cell in linha]
                linha = [cell.replace('OD', 'SEG. ODONTOLÓGICA').strip() if cell else '' for cell in linha]
                linha = [cell.replace('AMB', 'SEG. AMBULATORIAL').strip() if cell else '' for cell in linha]
                if colunas is None: #pegar cabecalho
                    colunas = linha
                elif linha != colunas:
                    dados.append(linha)


if dados:
    pd.DataFrame(dados, columns=colunas).to_csv("Teste_LucasDVargas.csv", index=False, encoding="utf-8-sig", sep=';')
    print("csv criado")
else:
    print("erro")
