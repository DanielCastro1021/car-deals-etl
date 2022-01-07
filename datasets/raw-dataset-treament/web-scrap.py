import pandas as pd
import requests
from bs4 import BeautifulSoup

df = pd.read_excel(
    "car-deals-etl/datasets/excel-datasets/dataset-car-deals.xlsx", header=[0]
)
prices = []
i = 0
for url in df["source page"]:
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    price = soup.find(class_="preco-destaques-inner-ficha")
    if price is None:
        prices.append("ViaturaVendida")
    else:
        price_text = price.get_text().replace(" ", "")
        print(price_text)
        prices.append(price.get_text())


df["price"] = prices
df.to_excel("dataset.xlsx")
