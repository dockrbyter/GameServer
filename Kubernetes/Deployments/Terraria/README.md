# Terraria
## DEPLOYMENT ⚙️
#### BATTERIES NOT INCLUDED!
Read the instructions on https://hub.docker.com/r/beardedio/terraria to provide valide world data. Run deployment to create storage object and scale to 0. Move you world data to the storage and rescale to 1.

### PREAMBLE

```bash
mkdir -p $HOME/kubernetes/manifests/terraria
cd $HOME/kubernetes/manifests/terraria
```
Copy the YAMLs into this directory.  

### PORTS
Check the ports in `service_terraria.yml` to adjust them as you need it.  

### RESOURCES
Edit the resources spec in `deployment_terraria.yml` acording to your cluster.  

### STORAGE
Edit `pvc_terraria.yml` acording to your clusters storage system.

### APPLY FILES
```bash
kubectl apply -f pvc_terraria.yml
kubectl apply -f service_terraria.yml
kubectl apply -f deployment_terraria.yml
```

## LINKS
- terraria: https://terraria.net/  
- Image terraria: https://hub.docker.com/r/beardedio/terraria
- https://terraria.wiki.gg/wiki/Guide:Setting_up_a_Terraria_server
