FROM osrf/ros:foxy-desktopros:foxy

# ENV variables
ENV ROS_DISTRO=foxy

RUN apt-get update && \
    apt dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    python-is-python3 \
	libopencv-dev \
	python3-opencv \
    libboost-all-dev \
    openssl \
    git \
    gdb \
	i2c-tools \
    libcurl4-openssl-dev \
    libssl-dev \
    curl \
    ros-foxy-imu-tools \
    ros-foxy-teleop-twist-joy \
    ros-foxy-rosbridge-server \
    libi2c-dev \
    ros-foxy-image-transport

# download repo
RUN mkdir ~/ws \
    cd ~/ws

RUN git clone https://github.com/PiatekBartosz/ROS_PointCloud_AGV.git