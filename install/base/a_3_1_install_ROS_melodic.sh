#!/bin/bash
cd
sudo apt update -y
sudo apt upgrade -y
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update -y
sudo apt install -y ros-melodic-desktop-full
sudo apt install -y python3-pip python3-all-dev python3-rospkg* python3-catkin-* python3-rosdistro* python3-pyparsing python3-rosdistro-modules python3-yaml
sudo apt install -y ros-melodic-desktop-full
sudo /bin/bash -c 'echo source /opt/ros/melodic/setup.bash >> /etc/bash.bashrc'
sudo /bin/bash -c 'echo export ROS_PYTHON_VERSION=3 >> /etc/bash.bashrc'

