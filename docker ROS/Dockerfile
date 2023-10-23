# to build docker image run:
# docker build -t <image_name> .
# to run bash files img must be named:
# "ros_gui:kinetic-desktop-full"

FROM osrf/ros:kinetic-desktop-full

RUN apt update
RUN apt install -y git && apt install -y python3-pip
RUN mkdir -p ~/AGV/ROS && \
    cd ~/AGV/

# TODO for now it runs demo appication
RUN git clone https://github.com/radar-lab/ti_mmwave_rospkg.git

RUN echo "Docker setup Done"