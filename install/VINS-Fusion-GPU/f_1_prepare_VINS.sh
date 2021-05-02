#!/bin/bash

sudo apt update -y
sudo apt upgrade -y


mkdir ~/AquilaBuild
cd ~/AquilaBuild


sudo apt-get install -y libgoogle-glog-dev libatlas-base-dev libsuitesparse-dev
wget http://ceres-solver.org/ceres-solver-1.14.0.tar.gz
tar -xvf ceres-solver-1.14.0.tar.gz

mkdir ceres-build
cd ceres-build
cmake -D BUILD_TESTING=ON \
      -D BUILD_EXAMPLES=ON \
      ../ceres-solver-1.14.0
make -j$(nproc)
sudo make -j$(nproc) install
sudo ldconfig

rm -rf ~/AquilaBuild