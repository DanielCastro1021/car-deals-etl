import pandas as pd


df = pd.read_excel("só barroso.xlsx", header=[0])

ids = []
for url in df["source page"]:
    url = url.rsplit("/", 1)[-1]
    ids.append(url)

df["id"] = ids

for desc in df["Descrição"]:
    print(desc)


# df.to_excel("dataset.xlsx")
