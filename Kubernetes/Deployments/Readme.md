# Deployments

kubectl apply -f and go! 🤠  

### PREAMBLE

```bash
mkdir -p $HOME/kubernetes/manifests
cd $HOME/kubernetes/manifests/GAMENAME
```
Copy the YAML's into this directory  

```bash
echo -n 'YOURadminPW' | base64
```

Copy the output into `secret_YOURgame.yml` at `exampleVALUE`.  

### PORTS
Check the Ports in `service_*.yml` to adjust them as you need it.  

### RESOURCES
Edit the resources spec in `deployment_*.yml` acording to your cluster.  

### STORAGE
Edit `pvc_*.yml` acording to your Clusters storage system.

### APPLY FILES
```bash
kubectl apply -f service_*.yml
kubectl apply -f pvc_*.yml
kubectl apply -f service_*.yml
kubectl apply -f deployment_*.yml
```
