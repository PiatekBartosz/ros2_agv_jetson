#!/bin/bash

xhost +local:root

docker run \
  --rm \
  -it \
  --runtime nvidia \
  --network host \
  --gpus all \
  -e DISPLAY \
  ${REGISTRY}/ros2_base:latest \
  bash
