# build images, tage 
docker build -t baodi76/multi-client:latest -t baodi76/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t baodi76/multi-server:latest -t baodi76/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t baodi76/multi-worker:latest -t baodi76/multi-worker:$SHA -f ./worker/Dockerfile ./worker
#push to docker hub
#push the latest version
docker push baodi76/multi-client:latest
docker push baodi76/multi-server:latest
docker push baodi76/multi-worker:latest
#push the $SHA version
docker push baodi76/multi-client:$SHA
docker push baodi76/multi-server:$SHA
docker push baodi76/multi-worker:$SHA


# apply all configs in the k8s folder
kubectl apply -f k8s

# imperatively set latest images
kubectl set image deployments/client-deployment server=baodi76/multi-client:$SHA
kubectl set image deployments/server-deployment server=baodi76/multi-server:$SHA
kubectl set image deployments/worker-deployment server=baodi76/multi-worker:$SHA