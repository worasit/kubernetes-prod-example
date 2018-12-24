#!/usr/bin/env bash
kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password