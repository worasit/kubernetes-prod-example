#!/usr/bin/env bash
URL=https://`minikube ip`
bash scripts/create-postgres-password-using-secret-object.sh
kubectl apply -f k8s/
echo "please enter the link $URL or execute '$ minikube dashboard' to check the deployment status."
