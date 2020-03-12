#!/bin/bash

cd ./frontend
./clean.sh
cd ..

cd ./backend
./clean.sh
cd ..

kubectl delete -f ingress.yaml
