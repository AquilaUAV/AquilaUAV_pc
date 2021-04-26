#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

rm -rf ~/AquilaBuild
mkdir ~/AquilaBuild
cd ~/AquilaBuild

sudo usermod -a -G dialout $USER
sudo apt remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y

wget https://s3-us-west-2.amazonaws.com/qgroundcontrol/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage
sudo mv QGroundControl.AppImage /usr/bin/qgroundcontrol
cd /usr/bin/
sudo ln -s qgroundcontrol QGroundControl

rm -rf ~/AquilaBuild

