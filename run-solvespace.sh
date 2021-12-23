#!/usr/bin/bash

xhost +

CURDIR=`(pwd)`
fc_source=$CURDIR/solvespace-source
fc_build=$CURDIR/solvespace-bin
fc_other=$CURDIR/solvespace-other

docker run -it --rm \
    -v $fc_source:/mnt/source \
    -v $fc_build:/mnt/build \
    -v $fc_other:/mnt/other \
    -e "DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    -e "HOME=/mnt/other/" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    solvespace-container:latest \
    /mnt/build/bin/solvespace
    #/bin/bash

