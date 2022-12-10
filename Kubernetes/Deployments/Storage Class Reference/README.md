# Storage Class Reference

Storage Class reference for Microk8s single node deployment. All storage objects will be mounted at `/mk8sstorage/gameserver/`.
```bash
mkdir -p /mk8sstorage/gameserver
kubectl apply -f storageclass_gameserver.yml
```

- https://microk8s.io/docs/addon-hostpath-storage
- https://kubernetes.io/docs/concepts/storage/storage-classes/
