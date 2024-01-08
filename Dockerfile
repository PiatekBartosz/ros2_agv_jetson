ARG ROS_DISTRO=humble

FROM luxonis/depthai-ros:v2.8.1-humble 

# FROM ros:&{ROS_DISTRO}-ros-base
# FROM luxonis/depthai-ros:foxy-latest
# FROM dustynv/ros:foxy-ros-base-l4t-r32.7.1
# FROM dustynv/ros:humble-pytorch-l4t-r32.7.1

ARG BUILD_TYPE="RelWithDebInfo"
ARG SIM=0
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install --no-install-recommends \
    zsh \
    software-properties-common \
    libusb-1.0-0-dev \
    python3-colcon-common-extensions \
    python3-rosdep \
    build-essential \
    gpiod \
    ros-${ROS_DISTRO}-pcl-ros \
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

# TODO for ti mmwave?
# install bootstrap tools
# RUN apt-get -o Acquire::ForceIPv4=true update && apt-get -o Acquire::ForceIPv4=true install --no-install-recommends -y \
#     ${GAZ} \
#     lib${GAZ}-dev \
#     ros-$ROS_DISTRO-desktop-full \
#     ros-$ROS_DISTRO-mavros \
#     ros-$ROS_DISTRO-mavros-extras \
#     ros-$ROS_DISTRO-octomap-* \
#     ros-$ROS_DISTRO-gazebo-plugins \
#     ros-$ROS_DISTRO-gazebo-ros \
#     ros-$ROS_DISTRO-gazebo-ros-control \
#     ros-$ROS_DISTRO-gazebo-ros-pkgs \
#     ros-$ROS_DISTRO-effort-controllers \
#     ros-$ROS_DISTRO-geographic-info \
#     ros-$ROS_DISTRO-hector-gazebo-plugins \
#     ros-$ROS_DISTRO-joint-state-controller \
#     ros-$ROS_DISTRO-joint-state-publisher \
#     ros-$ROS_DISTRO-joy \
#     ros-$ROS_DISTRO-joy-teleop \
#     ros-$ROS_DISTRO-kdl-parser-py \
#     ros-$ROS_DISTRO-key-teleop \
#     ros-$ROS_DISTRO-move-base \
#     ros-$ROS_DISTRO-robot-localization \
#     ros-$ROS_DISTRO-robot-state-publisher \
#     ros-$ROS_DISTRO-rqt \
#     ros-$ROS_DISTRO-rqt-common-plugins \
#     ros-$ROS_DISTRO-rqt-robot-plugins \
#     ros-$ROS_DISTRO-teleop-tools \
#     ros-$ROS_DISTRO-teleop-twist-joy \
#     ros-$ROS_DISTRO-teleop-twist-keyboard \
#     ros-$ROS_DISTRO-tf2-geometry-msgs \
#     ros-$ROS_DISTRO-tf2-tools \
#     ros-$ROS_DISTRO-urdfdom-py \
#     ros-$ROS_DISTRO-velodyne-gazebo-plugins \
#     ros-$ROS_DISTRO-xacro \
#     ros-$ROS_DISTRO-pointcloud-to-laserscan \
#     ros-$ROS_DISTRO-spacenav-node \
#     ros-$ROS_DISTRO-tf2-sensor-msgs \
#     ros-$ROS_DISTRO-twist-mux \
#     ros-$ROS_DISTRO-velodyne-simulator \
#     ros-$ROS_DISTRO-soem \
#     ros-$ROS_DISTRO-openslam-gmapping \
#     ros-$ROS_DISTRO-geodesy \
#     ros-$ROS_DISTRO-ddynamic-reconfigure \
#     ros-$ROS_DISTRO-rviz-imu-plugin \
#     python-catkin-tools \
#     python-rosdep \
#     python-rosinstall \
#     python-rosinstall-generator \
#     python-wstool \
#     python-vcstool \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*


# # oh my zsh
# ENV DEBIAN_FRONTEND=dialog
# RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# ws folder
ENV WS=/ws

# copy point cloud project 
RUN mkdir -p $WS/src
COPY ./ .$WS/src/ROS_PointCloud_AGV

# copy Texas Instruments ros driver
RUN cd ${WS}/src && git clone https://git.ti.com/git/mmwave_radar/mmwave_ti_ros.git
# RUN mv mmwave_ti_ros/ros2_driver/src/* . 
# RUN rm -rf mmwave_ti_ros


# RUN cd ${WS}/src && git clone --branch foxy https://github.com/luxonis/depthai-ros.git

# TODO for now skipping dependencies
# RUN cd .$WS/ && rosdep install --from-paths src --ignore-src  -y --skip-keys depthai --skip-keys depthai_bridge --skip-keys depthai_ros_driver --skip-keys audio_msgs --skip-keys laserscan_kinect --skip-keys ira_laser_tools


# TODO for now build manualy
# RUN cd .$WS/ && . /opt/ros/foxy/install/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
# #  setup env variables for ROS2 and colcon
# RUN echo "if [ -f ${WS}/install/setup.zsh ]; then source ${WS}/install/setup.zsh; fi" >> $HOME/.zshrc
# RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> $HOME/.zshrc
# RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> $HOME/.zshrc
# RUN echo "if [ -f ${WS}/install/setup.bash ]; then source ${WS}/install/setup.bash; fi" >> $HOME/.bashrc 

# set entry point executable
RUN chmod +x /ws/src/ROS_PointCloud_AGV/entrypoint.sh
ENTRYPOINT [ "/ws/ROS_PointCloud_AGV/entrypoint.sh" ]
CMD ["bash"]