FROM dustynv/ros:foxy-ros-base-l4t-r32.7.1

# ENV variables
ARG USERNAME=USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV ROS_DISTRO=foxy

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash

# RUN apt-get update && \
#     apt dist-upgrade -y && \
#     apt-get install -y --no-install-recommends \
#     python-is-python3 \
# 	libopencv-dev \
# 	python3-opencv \
#     libboost-all-dev \
#     openssl \
#     git \
#     gdb \
# 	i2c-tools \
#     libcurl4-openssl-dev \
#     libssl-dev \
#     curl \ 
#     ros-foxy-imu-tools \
#     ros-foxy-teleop-twist-joy \
#     ros-foxy-rosbridge-server \
#     libi2c-dev \
#     ros-foxy-image-transport
# download repo
# RUN mkdir ~/ws \
    # cd ~/ws

USER $USERNAME
CMD ["/bin/bash"]
