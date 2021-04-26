#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

rm -rf ~/AquilaBuild
mkdir ~/AquilaBuild
cd ~/AquilaBuild

python3 -m pip install packaging
python -m pip install packaging
python3 -m pip install jinja2
python -m pip install jinja2
python3 -m pip install toml
python -m pip install toml

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y libignition-math2

cd ~/catkin_ws/src/PX4-Autopilot
make -j$(nproc) clean
DONT_RUN=1 make -j$(nproc) px4_sitl gazebo

cd ~/catkin_ws
catkin_make -j$(nproc)

sudo /bin/bash -c 'echo source ~/catkin_ws/src/PX4-Autopilot/Tools/setup_gazebo.bash ~/catkin_ws/src/PX4-Autopilot ~/catkin_ws/src/PX4-Autopilot/build/px4_sitl_default >> /etc/bash.bashrc'
sudo /bin/bash -c 'echo export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:~/catkin_ws/src/PX4-Autopilot/ >> /etc/bash.bashrc'
sudo /bin/bash -c 'echo export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:~/catkin_ws/src/PX4-Autopilot/Tools/sitl_gazebo ~/catkin_ws/devel/setup.bash >> /etc/bash.bashrc'

rm -rf ~/AquilaBuild

