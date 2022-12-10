# FiveM Deployment for GTA V RP Server
## DEPLOYMENT ⚙️
#### BATTERIES NOT INCLUDED!
You may want to create an Ingress for TxAdmin WebGUI, but it's just need for the initial setup. After that you could make yourselfe to an admin and use the ingame pannel so you don't the WebGUI any more. To open the ingame pannel press `t` and type `/txadmin`.
  
You'll also need a free license key. [Click here](https://forum.cfx.re/t/explained-how-to-make-add-a-server-key/56120) to find out how to get one. At `Server IP address` set the external IP of your cluster.  

### PREAMBLE

```bash
mkdir -p $HOME/kubernetes/manifests/fivem
cd $HOME/kubernetes/manifests/fivem
```
Copy the YAMLs into this directory.  

```bash
echo -n 'YOURSERV3Rkey' | base64
```

Copy the output into `secret_fivem.yml` at `LICENSE_KEY`.  

### DATABASE
Skip this (and any other MySQL related step) if your cluster is already running a MySQl (or MariaDB) database 🤓

```bash
echo -n 'SUP3RST0NGP@ssW04D' | base64
```

Copy the output into `secret_mysql.yml` at `MYSQL_ROOT_PASSWORD`.  

### PORTS
Check the Ports in `service_fivem.yml` and `service_mysql.yml` to adjust them as you need it.  

### RESOURCES
Edit the resources spec in `deployment_fivem.yml` acording to your cluster.  

### STORAGE
Edit `pvc_fivem.yml` and `pvc_fivemtxt.yml` (and also `pvc_mysql.yml` if you using this MySQL deployment) acording to your clusters storage system.

### APPLY FILES
```bash
kubectl apply -f service_fivem.yml
kubectl apply -f secret_mysql.yml
kubectl apply -f pvc_fivem.yml
kubectl apply -f pvc_fivemtxt.yml
kubectl apply -f pvc_mysql.yml
kubectl apply -f service_fivem.yml
kubectl apply -f service_mysql.yml
kubectl apply -f deployment_fivem.yml
kubectl apply -f deployment_mysql.yml
```

# LINKS
- FiveM: https://fivem.net/  
- Image FiveM: https://hub.docker.com/r/spritsail/fivem  
- Image MySQL: https://hub.docker.com/_/mysql  
- ServerKey: https://keymaster.fivem.net/  
- ServerKey HowTo: https://forum.cfx.re/t/explained-how-to-make-add-a-server-key/56120
