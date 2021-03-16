#!/bin/bash

NUM_JOBS=$(nproc)

mkdir -p ~/catkin_workspaces/VINS-Fusion-GPU_ws/src
cd ~/catkin_workspaces/VINS-Fusion-GPU_ws/src
catkin_init_workspace
cd ~/catkin_workspaces/VINS-Fusion-GPU_ws
catkin_make -j$NUM_JOBS

sudo apt-get install -y libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev
sudo apt-get install -y ros-melodic-tf ros-melodic-image-transport

cd ~/AquilaBuild/
sudo apt-get install -y cmake
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y libeigen3-dev
sudo apt-get install -y libsuitesparse-dev

cd ~/AquilaBuild/
wget http://ceres-solver.org/ceres-solver-1.14.0.tar.gz
tar zxf ceres-solver-1.14.0.tar.gz
mkdir ceres-bin
cd ceres-bin
cmake -D BUILD_TESTING=ON \
    -D BUILD_EXAMPLES=ON \
    ../ceres-solver-1.14.0
make -j$NUM_JOBS
sudo make install

cd ~/catkin_workspaces/VINS-Fusion-GPU_ws/src
git clone https://github.com/ros-perception/vision_opencv --branch noetic

sed -i -e 's/find_package(Boost REQUIRED python37)/find_package(Boost REQUIRED python3)/g' vision_opencv/cv_bridge/CMakeLists.txt

sed -i -e 's/include <numpy\/ndarrayobject.h>/include <numpy\/ndarrayobject.h>\n#define NUMPY_IMPORT_ARRAY_RETVAL NULL/g' vision_opencv/cv_bridge/src/module.hpp

cd ~/catkin_workspaces/VINS-Fusion-GPU_ws/
catkin_make -j$NUM_JOBS

cd ~/catkin_workspaces/VINS-Fusion-GPU_ws/src
git clone https://github.com/IOdissey/VINS-Fusion-GPU.git
cd ../
catkin_make -j$NUM_JOBS
source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash

