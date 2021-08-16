#!/usr/bin/env bash

cd infra

# Declara variável para reutilização nas validações do diretório
PACKAGE="package"

# Cria o diretório e instala as dependências da função lambda
if [ -d $PACKAGE ]
then
    echo "O Diretorio "$PACKAGE" já existe."
else
    echo "===================================================="
    echo "Criando o diretório "$PACKAGE"..."
    mkdir $PACKAGE
    echo "O diretório "$PACKAGE" foi criado."
    echo "===================================================="
fi

# Declara variável que localiza o requirements com as dependências do projeto
FILE_REQUIREMENTS=../etl/lambda_requirements.txt

if [ -f $FILE_REQUIREMENTS ]
then
    echo "==============================================================="
    echo "Instalando dependências localizadas no "$FILE_REQUIREMENTS""
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "dependências instaladas com sucesso!"
    echo "================================================================"
fi

cd $PACKAGE

# Declara variável que localiza a função lambda para reutilização no código.
LAMBDA_FUNCTION=../../etl/lambda_function.py

if [ -f $LAMBDA_FUNCTION ]
then
    echo "==============================================================="
    echo "Copiando função handler..."
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip . # compacta o pacote para o deploy
    echo "Arquivo compactado com sucesso"
    echo "================================================================"
fi

cd ..