#!/bin/bash
echo "Removing OpenCV"
sudo apt remove -y ros-melodic*
sudo apt remove -y python-opencv
sudo apt remove -y python3-opencv
pip uninstall python-opencv
pip3 uninstall python-opencv
sudo sudo apt-get purge -y *libopencv*
sudo find / -name "*opencv*" -exec sudo rm -rf {} \;
sudo find / -name "*opencv*" -exec sudo rm -rfi {} \;
sudo rm -rf /usr/lib/python3.6/lib-dynload/cv2*
sudo rm -rf /usr/lib/python2.7/lib-dynload/cv2*
sudo rm -rf /usr/lib/python3.6/dist-packages/cv2
sudo rm -rf /usr/lib/python2.7/dist-packages/cv2
sudo rm -rf /usr/local/lib/python3.6/dist-packages/cv2
sudo rm -rf /usr/local/lib/python2.7/dist-packages/cv2
mkdir ~/AquilaBuild

