#!/bin/bash

mkdir ~/AquilaBuild
cd ~/AquilaBuild

sudo mkdir -p /opt/vins_ws/src
sudo chown -R $USER:$USER /opt/vins_ws
cd /opt/vins_ws/src
catkin_init_workspace
cd /opt/vins_ws
catkin_make
cd /opt/vins_ws/src
git clone https://github.com/ros-perception/vision_opencv -b noetic
sed -i 's/find_package(Boost REQUIRED python37)/find_package(Boost REQUIRED python3)/g' vision_opencv/cv_bridge/CMakeLists.txt
sed -i 's/#include <numpy\/ndarrayobject.h>/#include <numpy\/ndarrayobject.h>\n#define NUMPY_IMPORT_ARRAY_RETVAL NULL/g' vision_opencv/cv_bridge/src/module.hpp
# https://blog.csdn.net/yoga_wyj/article/details/108943846
cd /opt/vins_ws
catkin_make
source /opt/vins_ws/devel/setup.bash

sudo apt-get install -y ros-melodic-tf ros-melodic-image-transport
cd /opt/vins_ws/src
git clone https://github.com/IOdissey/VINS-Fusion-GPU.git
cd /opt/vins_ws
catkin_make
# source /opt/vins_ws/devel/setup.bash

rm -rf ~/AquilaBuild