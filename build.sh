#!/bin/bash

app_name=lbg-api-app
dockerhub_username=hayja500
tag=latest
image_name=${dockerhub_username}/${app_name}:${tag} 

docker build -t $image_name .

docker push $image_name

docker stop $app_name
docker rm $app_name
docker run -d -p 80:8080 --name $app_name $image_name


