#!/bin/bash

DOCKER_IMAGE_NAME="ros2_new" 
DOCKERFILE_PATH="ros2_cuda_amd64.Dockerfile"
PLATFORM="linux/amd64"

# build instance for docker 
docker buildx create --use --platform $PLATFORM

# build the image for two different platforms and push the images
docker buildx build \
  --platform $PLATFORM \
  -f $DOCKERFILE_PATH \
  -t $DOCKER_IMAGE_NAME \
  --output type=image,load=true \
  .

# revert to default builder instance
docker buildx use default