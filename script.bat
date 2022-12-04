echo "Criando as imagens da aplicação..."

docker build -t abdielmesquita/projeto-backend:1.0 backend/.
docker build -t abdielmesquita/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push abdielmesquita/projeto-backend:1.0
docker push abdielmesquita/projeto-database:1.0

echo "Criando Serviços no cluster K8s..."

kubectl apply -f ./services.yml

echo "Criando os Deployments..."

kubectl apply -f ./deployment.yml