# to build docker image run:
# docker build -t <image_name>
# to run bash files img must be named:
# "ros2_gui:humble-desktop-full"

FROM osrf/ros:humble-desktop-full

RUN apt update
RUN apt install -y git && apt install -y python3-pip
RUN mkdir -p ~/AGV/ROS2 && \
    cd ~/AGV/

# TODO download TI repo and make necesssary folders from docker file
# RUN git clone https://git.ti.com/git/mmwave_radar/mmwave_ti_ros.git 

RUN echo "Docker setup Done"