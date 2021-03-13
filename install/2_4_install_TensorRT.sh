#!/bin/bash

OS="ubuntu1804"
tag="cuda10.2-trt7.1.3.4-ga-20200617"

cd $(xdg-user-dir DOWNLOAD)
mv nv-tensorrt-repo-${OS}-${tag}_1-1_amd64.deb ~/AquilaBuild
cd ~/AquilaBuild

sudo dpkg -i nv-tensorrt-repo-${OS}-${tag}_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-${tag}/7fa2af80.pub

sudo apt-get update
sudo apt-get install tensorrt

sudo apt-get install python-libnvinfer-dev
sudo apt-get install python3-libnvinfer-dev

dpkg -l | grep TensorRT

