#!/bin/bash

NUM_JOBS=$(nproc)

rm -rf ~/catkin_ws

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make -j$NUM_JOBS
sudo /bin/bash -c 'echo source ~/catkin_ws/devel/setup.bash >> /etc/bash.bashrc'

sudo apt install -y ros-melodic-usb-cam

sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
sudo apt-get install -y librealsense2*

