# Kubernetes Cheatsheet
Cheatsheet with simple scripts that comes handy when required (Be it during set-up, trobleshooting or investigating issues with kubernetes cluster). 

**Extract list of pods along with the container name and image**
```sh
kubectl get pods -o custom-columns='podName:.metadata.name,Container:.spec.containers.*.name,Image:.spec.containers.*.image'
```

**Forcefully delete all un-healthy pods**
```sh
kubectl get pods -A --field-selector status.phase!="Running" | awk '{if ($4 != "Running") system ("kubectl -n " $1 " delete pods " $2 " --grace-period=0 " " --force ")}'
```
