# Lesson 1

```bash
# run pod nginx-1
kubectl apply -f pod.yaml
```

```console
namespace/bsa-pro created
pod/nginx-1 created
```

```bash
# run deployment nginx-deploy
kubectl apply -f deployment.yaml
```

```console
deployment.apps/nginx-deploy created
```

```bash
# update nginx to 1.7.9
sed 's/nginx:1\.7\.1/nginx:1.7.9/' deployment.yaml | kubectl apply -f -
```

```console
deployment.apps/nginx-deploy configured
```

```bash
# check rollout history
kubectl rollout history -f deployment.yaml
```

```console
eployment.apps/nginx-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

```bash
# rollout to revision 1
kubectl rollout undo -f deployment.yaml --to-revision=1
```

```console
deployment.apps/nginx-deploy rolled back
```

```bash
# verify nginx version
kubectl describe deployment nginx-deploy
```

```console
...
Pod Template:
  Labels:  app=bsa-pro
  Containers:
   nginx:
    Image:        nginx:1.7.1
    Port:         80/TCP
```

```bash
# list of all pods
kubectl get pods --all-namespaces
```

```console
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
default       nginx-1                            1/1     Running   0          5m
default       nginx-deploy-5ffb59786f-9cb6p      1/1     Running   0          118s
default       nginx-deploy-5ffb59786f-lbl4h      1/1     Running   0          2m
default       nginx-deploy-5ffb59786f-whjvz      1/1     Running   0          115s
kube-system   coredns-6955765f44-bp7d6           1/1     Running   0          81m
kube-system   coredns-6955765f44-fg9bl           1/1     Running   0          81m
kube-system   etcd-minikube                      1/1     Running   0          81m
kube-system   kube-apiserver-minikube            1/1     Running   0          81m
kube-system   kube-controller-manager-minikube   1/1     Running   0          81m
kube-system   kube-proxy-tt4fh                   1/1     Running   0          81m
kube-system   kube-scheduler-minikube            1/1     Running   0          81m
kube-system   storage-provisioner                1/1     Running   0          81m
```

```bash
# delete objects
kubectl delete -f pod.yaml
kubectl delete -f deployment.yaml
```

```console
namespace "bsa-pro" deleted
pod "nginx-1" deleted
deployment.apps "nginx-deploy" deleted
```
