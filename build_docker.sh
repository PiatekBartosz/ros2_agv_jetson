#!/bin/bash

# define a registry to push the images to
# export REGISTRY=piatekbartosz
# create new buildx that support multiple platforms
docker buildx create --use

DOCKER_IMAGE_NAME="ros2_new" 
DOCKERFILE_PATH="ROS2_foxy.Dockerfile"
PLATFORM="linux/amd64,linux/arm64"

# build the image for two different platforms and push the images
docker buildx build \
  --platform $PLATFORM \
  -f $DOCKERFILE_PATH \
  -t $DOCKER_IMAGE_NAME \
  --push .