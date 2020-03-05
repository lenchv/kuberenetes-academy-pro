#!/bin/bash

# run pod nginx-1
kubectl apply -f pod.yaml

# run deploy
kubectl apply -f deployment.yaml

# update nginx to 1.7.9
sed 's/nginx:1\.7\.1/nginx:1.7.9/' deployment.yaml | kubectl apply -f -

# check rollout history
kubectl rollout history -f deployment.yaml

# rollout to revision 1
kubectl rollout undo -f deployment.yaml --to-revision=1

# verify nginx version
kubectl describe deployment nginx-deploy | grep "nginx:1.7.1"

# list of all pods
kubectl get pods --all-namespaces

# delete objects
kubectl delete -f pod.yaml
kubectl delete -f deployment.yaml
