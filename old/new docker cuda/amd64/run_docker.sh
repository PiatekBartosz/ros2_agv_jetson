#!/bin/bash

# docker pull nvcr.io/nvidia/cudagl:11.3.0-devel-ubuntu20.04

xhost +local:root

docker run --gpus all -it \
  --rm \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  nvcr.io/nvidia/cudagl:11.3.0-devel-ubuntu20.04