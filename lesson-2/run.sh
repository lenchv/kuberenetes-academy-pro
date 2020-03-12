#!/bin/bash

# create deplyment and service

kubectl create -f bsa-app.yaml

sleep 10

# get endpoints

kubectl describe service bsa-app

# run temporary busybox pod
# connect to bsa-app service
# verify that each time there's a different hostname

kubectl run --rm -i \
	--tty busybox \
	--image=busybox \
	--restart=Never \
	-- wget -O- bsa-app:9876

kubectl run --rm -i \
	--tty busybox \
	--image=busybox \
	--restart=Never \
	-- wget -O- bsa-app:9876

kubectl run --rm -i \
	--tty busybox \
	--image=busybox \
	--restart=Never \
	-- wget -O- bsa-app:9876

# cleanup cluster

kubectl delete -f bsa-app.yaml