FROM dustynv/ros:foxy-ros-base-l4t-r32.7.1
# FROM dustynv/ros:humble-pytorch-l4t-r32.7.1

ENV ROS_DISTRO=foxy 
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG BUILD_SEQUENTIAL=0

ENV WS=/ws
RUN mkdir -p ${WS}/src
COPY ./ .$WS/src/agv-core
RUN cd .$WS/ && rosdep install --from-paths src --ignore-src  -y

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip

RUN apt-get update \
   && apt-get -y install --no-install-recommends \
   software-properties-common git libusb-1.0-0-dev \
   wget python3-colcon-common-extensions

# install this manualy, they are problematic
# RUN pip install depthai -y
# RUN apt install python3-opencv

RUN source /opt/ros/foxy/install/setup.bash

CMD ["/bin/bash"]