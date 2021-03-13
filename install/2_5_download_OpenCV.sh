#!/bin/bash


OPENCV_VERSION=4.5.1
ARCH_BIN=5.3
INSTALL_DIR=/usr/local
DOWNLOAD_OPENCV_EXTRAS=YES
OPENCV_SOURCE_DIR=~/AquilaBuild
WHEREAMI=$PWD
NUM_JOBS=$(nproc)
CLEANUP=true
PACKAGE_OPENCV="-D CPACK_BINARY_DEB=ON"
CMAKE_INSTALL_PREFIX=$INSTALL_DIR

cd $OPENCV_SOURCE_DIR

wget -O opencv.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
wget -O opencv_extra.zip https://github.com/opencv/opencv_extra/archive/${OPENCV_VERSION}.zip
unzip opencv.zip
unzip opencv_contrib.zip
unzip opencv_extra.zip

