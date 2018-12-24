#!/usr/bin/env bash

# In order to do `helm init` command we need to create these service accounts
# Use helm to install nginx-ingress : https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

# Create a new service account called 'tiller' in the kube-system namespace
kubectl create serviceaccount --namespace kube-system tiller

# Create a new clusterrolebinding with the role 'cluster-admin' and assign it to service account 'tiller'
kubectl create clusterrolebinding \
               tiller-cluster-rule \
               --clusterrole=cluster-admin \
               --serviceaccount=kube-system:tiller