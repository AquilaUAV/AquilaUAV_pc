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
pip install --user --upgrade pip
pip3 install --user --upgrade pip
pip install --user numpy
pip install --user pillow
pip install --user imutils
pip3 install --user numpy
pip3 install --user pillow
pip3 install --user imutils
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
