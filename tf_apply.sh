# #!/bin/bash

# # Ensure that the necessary Terraform configuration is applied first
# echo "Starting initial Terraform apply for EKS cluster, namespaces, and core resources..."
# TF_VAR_skip_route53=true TF_VAR_skip_helm=true terraform apply -auto-approve

# # Configure kubeconfig for EKS cluster
# echo "Configuring kubeconfig for EKS cluster..." 

#sudo aws eks update-kubeconfig --name tooling-app-eks --region us-west-1 --kubeconfig ./kubeconfig
#sudo -E aws eks --region us-east-1 update-kubeconfig --name tooling-app-eks --kubeconfig /root/.kube/config
# # Verify kubeconfig creation
# if [[ ! -f "./kubeconfig" ]]; then
#   echo "Error: kubeconfig file not created."
#   exit 1
# fi

# export KUBECONFIG=./kubeconfig
# echo "Waiting for Kubernetes API server to become reachable..."
# while ! kubectl version --kubeconfig=$KUBECONFIG --request-timeout=10s &>/dev/null; do
#     echo "Kubernetes API server is not reachable. Retrying in 20 seconds..."
#     sleep 20
# done
# echo "Kubernetes API server is reachable."

# # Run second Terraform apply to ensure namespace and other resources are created
# echo "Running Terraform apply to prepare for cert-manager import..."
# TF_VAR_skip_route53=false TF_VAR_skip_helm=false terraform apply -auto-approve




# kubectl delete certificate tooling.artifactory.liberttinnii.xyz -n tools
# kubectl delete certificaterequest tooling.artifactory.liberttinnii.xyz-1 -n tools

# kubectl logs -l app=cert-manager -n cert-manager -f


# kubectl exec -it ingress-nginx-controller-7c4bdfc85d-dbfgs -n ingress-nginx -- /bin/bash

## Use kubectl cp to directly copy the actual cert and key files from the symbolic link pointing to ..data/cert data directory.
# kubectl cp ingress-nginx/ingress-nginx-controller-7c4bdfc85d-dbfgs:/usr/local/certificates/..data/cert ./certificates/cert
# kubectl cp ingress-nginx/ingress-nginx-controller-7c4bdfc85d-dbfgs:/usr/local/certificates/..data/key ./certificates/key