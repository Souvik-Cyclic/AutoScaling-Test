#!/bin/bash
IMAGE_NAME="flask-app"

echo "Building the docker image"
docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq --filter "name=$IMAGE_NAME")" ]; then
    echo "Stopping and removing the existing container"
    docker stop $(docker ps -aq --filter "name=$IMAGE_NAME")
    docker rm -f $(docker ps -aq --filter "name=$IMAGE_NAME")
else
    echo "No existing container found"
fi

echo "Removing dangling images"
docker image prune -f

echo "Starting the container"
docker run -d -p 5000:5000 --restart always --name $IMAGE_NAME $IMAGE_NAME
echo "${IMAGE_NAME} is running on port 5000"