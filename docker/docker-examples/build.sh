#!/bin/bash
cd docker/docker-examples
echo "##########"
whoami
echo "##########"
echo "Building image"
docker image build -t docanmol/morning-devops:v$BUILD_NUMBER .
echo "Push image to docker registry"
docker push docanmol/morning-devops:v$BUILD_NUMBER
echo "Stopping existing container"
docker container stop myapp || true
echo "Removing container"
docker container rm myapp || true
echo "Creating new container with new build"
docker container run -itd --name myapp -p 8090:3000 docanmol/morning-devops:v$BUILD_NUMBER
echo "Listing running containers"
docker container ps
