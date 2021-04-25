#!/bin/bash

echo "Removing OpenCV"
sudo apt -y install htop nano
sudo apt remove -y ros-melodic*
sudo apt remove -y python-opencv
sudo apt remove -y python3-opencv
python -m pip uninstall python-opencv
python3 -m pip uninstall python-opencv
sudo sudo apt-get purge -y *libopencv*
sudo rm -rf /usr/lib/python3.6/lib-dynload/cv2*
sudo rm -rf /usr/lib/python2.7/lib-dynload/cv2*
sudo rm -rf /usr/lib/python3.6/dist-packages/cv2
sudo rm -rf /usr/lib/python2.7/dist-packages/cv2
sudo rm -rf /usr/local/lib/python3.6/dist-packages/cv2
sudo rm -rf /usr/local/lib/python2.7/dist-packages/cv2
sudo rm -rf ~/catkin_ws
mkdir ~/AquilaBuild
