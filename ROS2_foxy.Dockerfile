FROM ros:foxy

RUN apt update && \ 
    apt install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    wget \
    git \
    nano \
    gdb \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "./ros_entrypoint.sh" ]
CMD [ "bash" ]