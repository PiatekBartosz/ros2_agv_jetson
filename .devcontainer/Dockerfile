ARG ROS_DISTRO=foxy
# FROM ros:&{ROS_DISTRO}-ros-base
# FROM luxonis/depthai-ros:foxy-latest
FROM dustynv/ros:foxy-ros-base-l4t-r32.7.1
# FROM dustynv/ros:humble-pytorch-l4t-r32.7.1

# ARG BUILD_TYPE="RelWithDebInfo"
# ARG SIM=0
# ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install --no-install-recommends \
    zsh \
    software-properties-common \
    libusb-1.0-0-dev \
    python3-colcon-common-extensions \
    python3-rosdep \
    build-essential \
    gpiod \
    # libasound2-dev \
    # ros-foxy-cv-bridge \ 
    # ros-foxy-image-transport \
    # ros-foxy-image-transport-plugins \
    # ros-foxy-rmw-cyclonedds-cpp \
    gstreamer1.0-plugins-bad \
    alsa-utils \
    mpg123 \
    libmpg123-dev \
    # ros-foxy-rtabmap-slam \ 
    unzip \
    ffmpeg \
    # ros-foxy-image-proc \
    git \
    wget \
    htop

# # oh my zsh
# ENV DEBIAN_FRONTEND=dialog
# RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# ws folder
ENV WS=/ws

# copy point cloud project 
RUN mkdir -p $WS/src
COPY ./ .$WS/src/ROS_PointCloud_AGV

# depthai-ros copy and build
RUN cd ${WS}/src && git clone --branch foxy https://github.com/luxonis/depthai-ros.git

# RUN cd .$WS/ && rosdep install --from-paths src --ignore-src  -y --skip-keys depthai --skip-keys depthai_bridge --skip-keys depthai_ros_driver --skip-keys audio_msgs --skip-keys laserscan_kinect --skip-keys ira_laser_tools
# RUN cd .$WS/ && . /opt/ros/${ROS_DISTRO}/setup.sh && . /sai_ros/spectacularai_ros2/install/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=${BUILD_TYPE}

# #  setup env variables for ROS2 and colcon
# RUN echo "if [ -f ${WS}/install/setup.zsh ]; then source ${WS}/install/setup.zsh; fi" >> $HOME/.zshrc
# RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> $HOME/.zshrc
# RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> $HOME/.zshrc
# RUN echo "if [ -f ${WS}/install/setup.bash ]; then source ${WS}/install/setup.bash; fi" >> $HOME/.bashrc 

# set entry point executable
RUN chmod +x /ws/src/ROS_PointCloud_AGV/entrypoint.sh
ENTRYPOINT [ "/ws/ROS_PointCloud_AGV/entrypoint.sh" ]
CMD ["bash"]