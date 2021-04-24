#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

sudo apt install -y build-essential cmake pkg-config unzip yasm git checkinstall
sudo apt install -y libjpeg-dev libpng-dev libtiff-dev
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libavresample-dev
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt install -y libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt install -y libfaac-dev libmp3lame-dev libvorbis-dev
sudo apt install -y libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd -
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y python3-dev python3-pip
sudo apt-get install -y python-dev python-pip
sudo apt-get install -y python3-testresources
sudo apt-get install -y python-testresources
python -m pip install --upgrade pip
python3 -m pip install --upgrade pip
python -m pip install numpy
python -m pip install pillow
python -m pip install imutils
python3 -m pip install numpy
python3 -m pip install pillow
python3 -m pip install imutils
sudo apt-get install -y libtbb-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt-get install -y nvidia-opencl-dev
sudo apt-get install -y python-bs4
sudo apt-get install -y python3-bs4
sudo apt-get install -y libfreeimage3 libfreeimage-dev
sudo apt-get install -y qtbase5-dev
sudo apt-get install -y qtdeclarative5-dev
sudo apt-get install -y libopenblas-dev
sudo apt-get install -y liblapacke-dev
sudo apt-get update
sudo apt-get install -y build-essential make cmake cmake-curses-gui git g++ pkg-config curl
sudo apt-get install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libeigen3-dev libglew-dev libgtk2.0-dev
sudo apt-get install -y libtbb2 libtbb-dev libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y libdc1394-22-dev libxine2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libjasper-dev
sudo apt-get install -y libjpeg8-dev libjpeg-turbo8-dev libtiff-dev libpng-dev
sudo apt-get install -y libxvidcore-dev libx264-dev libgtk-3-dev
sudo apt-get install -y libatlas-base-dev libopenblas-dev liblapack-dev liblapacke-dev gfortran
sudo apt-get install -y qt5-default

