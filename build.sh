#!/bin/bash

app_name=lbg-api-app
dockerhub_username=hayja500
tag=latest
image_name=${dockerhub_username}/${app_name}:${tag} 
container_port=5000

docker build -t $image_name .

docker push $image_name

docker stop $app_name
docker rm $app_name
docker run -d -p 80:$container_port -e PORT=$container_port --name $app_name $image_name


