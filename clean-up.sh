#!/usr/bin/env bash
kubectl delete secrets pgpassword
kubectl delete -f k8s/