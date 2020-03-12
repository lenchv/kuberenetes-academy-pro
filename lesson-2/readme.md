# Lesson 2

- Create a deployment:

	- name: *bsa-app*
	- image: *dgkanatsios/simpleapp*
	- replicas: *3*
	- label: *app=test*
	- port: *8080*

- Create service to expose deployment on *9876* port:
	
```bash
# create deplyment and service

> kubectl create -f bsa-app.yaml

# get endpoints

> kubectl describe service bsa-app

Name:              bsa-app
Labels:            app=test
...
Endpoints:         172.17.0.4:8080,172.17.0.5:8080,172.17.0.6:8080
Session Affinity:  None

# run temporary busybox pod

> kubectl run --rm -i \
	--tty busybox \
	--image=busybox \
	--restart=Never \
	-- sh

# connect to bsa-app service

> wget -O- bsa-app:9876

Hello world from bsa-app-7cd757d5b5-hd5vf and version 2.0

# verify that each time there's a different hostname

> wget -O- bsa-app:9876

Hello world from bsa-app-7cd757d5b5-z92qf and version 2.0

> wget -O- bsa-app:9876

Hello world from bsa-app-7cd757d5b5-s5l49 and version 2.0

> exit

# cleanup cluster

> kubectl delete -f bsa-app.yaml

```
