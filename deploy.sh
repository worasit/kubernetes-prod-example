#!/usr/bin/env bash

CLIENT_IMAGE_SHA=worasit501/multi-client:${SHA} 
SERVER_IMAGE_SHA=worasit501/multi-server:${SHA}
WORKER_IMAGE_SHA=worasit501/multi-worker:${SHA}

CLIENT_IMAGE_LATEST=worasit501/multi-client:latest
SERVER_IMAGE_LATEST=worasit501/multi-server:latest
WORKER_IMAGE_LATEST=worasit501/multi-worker:latest

docker build -t ${CLIENT_IMAGE_LATEST} -t ${CLIENT_IMAGE_SHA} -f ./client/Dockerfile ./client/
docker build -t ${SERVER_IMAGE_LATEST} -t ${SERVER_IMAGE_SHA} -f ./server/Dockerfile ./server/
docker build -t ${WORKER_IMAGE_LATEST} -t ${WORKER_IMAGE_SHA} -f ./worker/Dockerfile ./worker/

docker push ${CLIENT_IMAGE_LATEST}
docker push ${SERVER_IMAGE_LATEST}
docker push ${WORKER_IMAGE_LATEST}
docker push ${CLIENT_IMAGE_SHA}
docker push ${SERVER_IMAGE_SHA}
docker push ${WORKER_IMAGE_SHA}

# Apply all k8s configuration
kubectl apply -f k8s/

# To force update image version on each pods
kubectl set image deployments/client-deployment client=${CLIENT_IMAGE_SHA}
kubectl set image deployments/server-deployment multi-server=${SERVER_IMAGE_SHA}
kubectl set image deployments/worker-deployment worker=${WORKER_IMAGE_SHA}