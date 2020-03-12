#!/bin/bash

cd ./frontend
./deploy.sh
cd ..

cd ./backend
./deploy.sh
cd ..

kubectl apply -f ingress.yaml
