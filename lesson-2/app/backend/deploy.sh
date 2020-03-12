#!/bin/bash

docker build -t lenchv/k8s-app-backend:0.0.1 .

kubectl apply -f backend.yaml

sleep 5

kubectl get pods
kubectl describe service
