#!/bin/bash
TAG=opsgenie-builder
DOCKER_BUILD_FOLDER=/opt/terraform-provider-opsgenie/bin

if [ ! -d "$(pwd)/bin" ]; then
  mkdir "$(pwd)/bin";
fi

docker build -t $TAG . &&\
docker create --name opsgenie-build -it $TAG &&\
docker cp "opsgenie-build:${DOCKER_BUILD_FOLDER}/terraform-provider-opsgenie" ./bin/terraform-provider-opsgenie &&\
docker stop opsgenie-build &&\
docker rm opsgenie-build &&\
docker rmi -f $TAG &&\
echo "Opsgenie plugin built and copied to $(pwd)/bin/terraform-provider-opsgenie"
