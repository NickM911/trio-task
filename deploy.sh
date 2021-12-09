#!/bin/bash

# Ceate Network
docker network create trio-task-network-2

#Build images
docker build -t trio-db db
docker build -t trio-flask-app flask-app

#Run db Container
docker run -d \
    --network trio-task-network-2 \
    --name mysql \
    trio-db

#Run flask app container
docker run -d \
    --network trio-task-network-2 \
    --name flask-app \
    trio-flask-app

#Run nginx container for bind mount
# open up ports and bind mount
docker run -d \
    --network trio-task-network-2 \
    --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    -p 80:80 \
    --name nginx \
    nginx:alpine
