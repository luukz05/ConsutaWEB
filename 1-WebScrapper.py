import requests
from bs4 import BeautifulSoup
import wget
import os
import shutil

os.makedirs("pdfs", exist_ok=True)
caminho = os.path.join("pdfs")

url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'
page = requests.get(url)
soup = BeautifulSoup(page.text, 'html.parser')

for hrefs in soup.find_all("a", class_="internal-link", string=["Anexo I.", "Anexo II."])[:2]: #retorna lista
    wget.download(hrefs.get('href'), caminho)

shutil.make_archive(caminho.replace(".zip", ""), 'zip', caminho)



