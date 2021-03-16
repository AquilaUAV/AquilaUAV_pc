#!/bin/bash

mkdir -p ~/catkin_workspaces/rosbag
cd ~/catkin_workspaces/rosbag

if [ ! -f d435_stairs.bag ]
then
    wget https://librealsense.intel.com/rs-tests/TestData/stairs.bag
    mv stairs.bag d435_stairs.bag
fi

if [ ! -f d435i_walk_around.bag ] || [ ! -f d435i_walking.bag ]
then
    wget https://librealsense.intel.com/rs-tests/TestData/d435i_sample_data.zip
    unzip -o d435i_sample_data.zip
    rm -rf d435i_sample_data.zip
fi

if [ ! -f d415_depth_under_water.bag ]
then
    wget https://librealsense.intel.com/rs-tests/TestData/depth_under_water.bag
    mv depth_under_water.bag d415_depth_under_water.bag
fi

if [ ! -f avoidance_d435_2.bag ]
then
    wget https://www.dropbox.com/sh/xgacou4vm2un12r/AADqKU1TWbBh0xDL5C7DyEtMa/avoidance_d435_2.bag.tar.gz
    tar -xzf avoidance_d435_2.bag.tar.gz
    rm -rf avoidance_d435_2.bag.tar.gz
fi

