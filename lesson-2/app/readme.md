# Kubernetes application

Install nginx-ingress for minkube

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
minikube addons enable ingress
kubectl get pods -n ingress-nginx
```

Start

```
./deploy.sh
```

Stop

```
./clean.sh
```
