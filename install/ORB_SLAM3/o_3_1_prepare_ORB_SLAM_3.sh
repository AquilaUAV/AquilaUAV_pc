#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

rm -rf ~/AquilaBuild
mkdir ~/AquilaBuild
cd ~/AquilaBuild


git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git ORB_SLAM3



rm -rf ~/AquilaBuild
