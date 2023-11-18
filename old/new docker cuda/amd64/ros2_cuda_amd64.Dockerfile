FROM nvcr.io/nvidia/cudagl:11.3.0-devel-ubuntu20.04 as amd64_base

FROM ${TARGETARCH}_base as dev

# consts
ENV ROS_DISTRO=foxy
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV ROS_PYTHON_VERSION=3
ENV SHELL /bin/bash

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
 
ENV DEBIAN_FRONTEND=noninteractive
ENV RTI_NC_LICENSE_ACCEPTED=yes
 
# change the locale from POSIX to UTF-8
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
 
RUN apt update \
  && apt upgrade -y \
  && apt install -y \
    software-properties-common \
    curl \
    wget \
    gnupg2 \
    lsb-release \
    software-properties-common \
    terminator \
    build-essential \
    cmake \
    git \
    python3 \
    libpython3-dev \
    xorg-dev \
    libusb-1.0-0-dev \
    libxinerama-dev \
    python3 \
    python3-dev \
    libpython3.8-dev \
    gcc-8 g++-8 \
  && rm /usr/bin/gcc /usr/bin/g++ \
  && ln -s gcc-8 /usr/bin/gcc \
  && ln -s g++-8 /usr/bin/g++ \
  && add-apt-repository universe

# RUN apt update && apt install -y \
#   libbullet-dev \
#   python3-pip   

# ## Dependencies
# RUN apt install -y libflann-dev \
#   libvtk6-dev \
#   libvtk6-qt-dev \
#   libpcap-dev \
#   libboost-filesystem-dev \
#   libboost-iostreams-dev \
#   libboost-system-dev \
#   libboost-date-time-dev