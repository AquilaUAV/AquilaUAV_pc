#!/bin/bash

export $(cat ~/.config/user-dirs.dirs | grep XDG_DOWNLOAD_DIR)
cd $(eval echo $XDG_DOWNLOAD_DIR)

if [ ! -f V2_03_difficult.bag ]; then
    wget http://robotics.ethz.ch/~asl-datasets/ijrr_euroc_mav_dataset/vicon_room2/V2_03_difficult/V2_03_difficult.bag
fi

gnome-terminal -- bash -c "source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash; roscore"
sleep 2

gnome-terminal -- bash -c "source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash; rosrun vins vins_node ~/catkin_workspaces/VINS-Fusion-GPU_ws/src/VINS-Fusion-GPU/config/euroc/euroc_stereo_imu_config.yaml"

gnome-terminal -- bash -c "source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash; rosrun loop_fusion loop_fusion_node ~/catkin_workspaces/VINS-Fusion-GPU_ws/src/VINS-Fusion-GPU/config/euroc/euroc_stereo_imu_config.yaml"

gnome-terminal -- bash -c "rosrun rqt_image_view rqt_image_view /cam0/image_raw"
sleep 2

gnome-terminal -- bash -c "source ~/catkin_workspaces/VINS-Fusion-GPU_ws/devel/setup.bash; roslaunch vins vins_rviz.launch"

rosbag play V2_03_difficult.bag

rm -rf ~/.config/autostart/AquilaUAV_installation.desktop
rm -rf ~/AquilaUAV_pc/installing_queue/f_2_VINS-Fusion-GPU_test.sh
~/AquilaUAV_pc/continue_installation.sh
killall gnome-terminal-server

