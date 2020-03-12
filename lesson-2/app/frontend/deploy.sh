#!/bin/bash

eval $(minikube docker-env)

docker build -t lenchv/k8s-frontend:0.0.3 .

kubectl apply -f frontend.yaml
