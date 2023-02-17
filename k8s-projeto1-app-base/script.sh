#!/bin/bash

echo "Criando as imagens.........."

docker build -t joaosilvaaa/projeto-backend:1.0 backend/.
docker build -t joaosilvaaa/projeto-databse:1.0 database/.

echo "Realizando o push das imagens ......"

docker push joaosilvaaa/projeto-backend:1.0
docker push joaosilvaaa/projeto-dbase:1.0

echo "Criando servicos no cluster kubernetes ....."

kubectl apply -f ./services.yml

echo "Criando os deployments.........."

kubectl apply -f ./deployment.yml