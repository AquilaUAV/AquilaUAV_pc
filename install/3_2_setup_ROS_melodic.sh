#!/bin/bash

NUM_JOBS=$(nproc)

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make -j$NUM_JOBS
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install ros-melodic-usb-cam

