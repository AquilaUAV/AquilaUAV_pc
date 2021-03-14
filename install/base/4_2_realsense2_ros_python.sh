#!/bin/bash

python -m pip install pyrealsense2 --user
python3 -m pip install pyrealsense2 --user
sudo apt install -y ros-melodic-realsense2-*

cd /usr/lib/python3.6/lib-dynload
sudo ln -s /usr/local/lib/python2.7/dist-packages/pyrealsense2/pyrealsense2.so
sudo ln -s /usr/local/lib/python2.7/dist-packages/pyrealsense2/pybackend2.so
cd /usr/lib/python2.7/lib-dynload
sudo ln -s /usr/local/lib/python2.7/dist-packages/pyrealsense2/pyrealsense2.so
sudo ln -s /usr/local/lib/python2.7/dist-packages/pyrealsense2/pybackend2.so

