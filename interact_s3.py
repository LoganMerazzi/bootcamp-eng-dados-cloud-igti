'''
  Docstring, para o linter validar...
'''

# Se der erro na importação do boto e do pandas, rodar um pip install boto3 e pip install pandas
import boto3
import pandas as pd

#Criar um cliente para interagir com a AWS S3
s3_client = boto3.client('s3')

s3_client.download_file("datalake-logan-igti-edc",
                         "data/esus-vepi.LeitoOcupacao.csv",
                         "data/esus-vepi.LeitoOcupacao.csv")

df = pd.read_csv("data/esus-vepi.LeitoOcupacao.csv")
print(df)

s3_client.upload_file("data/ITENS_PROVA_2017.csv",
                      "datalake-logan-igti-edc",
                      "data/ITENS_PROVA_2017.csv")
                      