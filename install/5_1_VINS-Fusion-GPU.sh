#!/bin/bash

NUM_JOBS=$(nproc)

sudo apt-get install -y libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev
sudo apt-get install ros-melodic-tf ros-melodic-image-transport

cd ~/AquilaBuild/
sudo apt-get install cmake
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libsuitesparse-dev
wget http://ceres-solver.org/ceres-solver-1.14.0.tar.gz
tar zxf ceres-solver-1.14.0.tar.gz
mkdir ceres-bin
cd ceres-bin
cmake -D BUILD_TESTING=OFF \
      -D BUILD_EXAMPLES=OFF \
      ../ceres-solver-1.14.0
make -j$NUM_JOBS
sudo make install

cd ~/catkin_ws/src
git clone https://github.com/ros-perception/vision_opencv
vision_opencv/cv_bridge/CMakeLists.txt

sed -i -e 's/find_package(Boost REQUIRED python37)/find_package(Boost REQUIRED python3)/g' vision_opencv/cv_bridge/CMakeLists.txt

#sed -i -e 's/include <numpy//ndarrayobject.h>/include <numpy//ndarrayobject.h>' vision_opencv/cv_bridge/src/module.hpp


#include <numpy/ndarrayobject.h>
#define NUMPY_IMPORT_ARRAY_RETVAL NULL

cd ../
catkin_make -j$NUM_JOBS

cd ~/catkin_ws/src
git clone https://github.com/IOdissey/VINS-Fusion-GPU.git
cd ../
catkin_make -j$NUM_JOBS
source ~/catkin_ws/devel/setup.bash


