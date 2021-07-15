### need to install the ingress controller before run it into K8S at  Docker Desktop
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/cloud/deploy.yaml

### remove the ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.47.0/deploy/static/provider/cloud/deploy.yaml

### if you want to see dashboard
1. https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
2. kubectl apply -f kubernetes-dashboard.yaml
3. kubectl proxy
4. http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

### in order to run postgres with passwordd, need to create secret inside K8S
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345zxca!!!