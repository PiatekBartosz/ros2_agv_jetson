xhost local:root

XAUTH=/tmp/.docker.xauth

docker run -it \
    --name=ROS2_container \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --net=host \
    --privileged \
    --runtime=nvidia \
    haiderabbasi333/ros2-pathplanning-course:1 \
    bash

echo "Done."