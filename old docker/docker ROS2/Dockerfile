# to build docker image run:
# docker build -t <image_name>
# to run bash files img must be named:
# "ros2_gui:foxy-desktop"

FROM osrf/ros:foxy-desktop

RUN apt update
RUN apt install -y git && apt install -y python3-pip
RUN mkdir -p ~/AGV/ROS2 && \
    cd ~/AGV/

# TODO for now it runs demo appication
RUN git clone https://github.com/kimsooyoung/mmwave_ti_ros.git

RUN echo "Docker setup Done"