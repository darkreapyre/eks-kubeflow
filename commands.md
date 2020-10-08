# Useful K8s Commands

### Create .kubeconfig

```shell
eksctl utils write-kubeconfig --cluster $AWS_CLUSTER_NAME
```

### Confirm cluster connectivity
```shell
kubectl get nodes
```

### Launch Kubeflow dashboard
```shell
kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80
```

---
# Install KubeFlow from Cloud9

```shell
sudo su -
source /home/ec2-user/eks-kubeflow-cloudformation-quick-start/kf-install.sh 
eksctl utils write-kubeconfig --cluster ${AWS_CLUSTER_NAME}
cd ${KF_DIR} && kfctl apply -V -f ${CONFIG_FILE}
kubectl -n kubeflow get all
```

