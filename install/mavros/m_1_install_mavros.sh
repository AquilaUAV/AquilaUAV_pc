#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install -y ros-melodic-mav*

rm -rf ~/AquilaBuild
mkdir ~/AquilaBuild
cd ~/AquilaBuild

wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh

cd ~/catkin_ws/src
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh

rm -rf ~/AquilaBuild

