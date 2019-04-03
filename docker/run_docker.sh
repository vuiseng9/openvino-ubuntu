#!/bin/sh

container=ubuntu-media
container=openvino-ubuntu

sudo xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $container`

sudo docker run \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/${USER}:/hosthome \
    --device=/dev/dri:/dev/dri \
    --privileged \
    -w /workspace \
    -it ${container} bash
