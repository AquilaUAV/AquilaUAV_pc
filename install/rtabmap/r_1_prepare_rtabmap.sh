#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

mkdir ~/AquilaBuild
cd ~/AquilaBuild

source /opt/vins_ws/devel/setup.bash
sudo apt install -y ros-melodic-rtabmap ros-melodic-rtabmap-ros
sudo apt remove -y ros-melodic-rtabmap ros-melodic-rtabmap-ros
sudo apt install -y ros-melodic-libg2o

sudo add-apt-repository -y ppa:borglab/gtsam-release-4.0
sudo apt update -y
sudo apt install -y libgtsam-dev libgtsam-unstable-dev
sudo apt install -y ros-melodic-imu-filter-madgwick

cd ~/AquilaBuild
git clone https://github.com/introlab/rtabmap.git rtabmap
cd rtabmap/build
cmake ..
make -j$(nproc)
sudo make -j$(nproc) install
sudo ldconfig

# DIFFERENT FILE below

sudo mkdir -p /opt/rtabmap_ws/src
sudo chown -R $USER:$USER /opt/rtabmap_ws
cd /opt/rtabmap_ws/src
catkin_init_workspace
cd /opt/rtabmap_ws
catkin_make
cd /opt/rtabmap_ws/src
git clone https://github.com/introlab/rtabmap_ros.git rtabmap_ros
cd /opt/rtabmap_ws
catkin_make -DRTABMAP_SYNC_MULTI_RGBD=ON -DRTABMAP_SYNC_USER_DATA=ON


# TESTING

roscore

roslaunch realsense2_camera rs_t265.launch enable_fisheye1:=true enable_fisheye2:=true unite_imu_method:=linear_interpolation enable_gyro:=true enable_accel:=true enable_sync:=true

rosparam set /camera/tracking_module/enable_mapping false

rosrun camera_calibration cameracalibrator.py --approximate 0.1 --size 8x6 --square 0.108 right:=/camera/fisheye2/image_raw left:=/camera/fisheye1/image_raw right_camera:=/camera/fisheye2 left_camera:=/camera/fisheye1

rosrun imu_filter_madgwick imu_filter_node \
    _use_mag:=false \
    _publish_tf:=false \
    _world_frame:="enu" \
    /imu/data_raw:=/camera/imu \
    /imu/data:=/rtabmap/imu

python camera_info_pub.py \
   _url:=/home/d3dx13/left.yaml \
   image:=/camera/fisheye1/image_raw \
   camera_info:=/camera/fisheye1/camera_info_calib

python camera_info_pub.py \
   _url:=/home/d3dx13/right.yaml \
   image:=/camera/fisheye2/image_raw \
   camera_info:=/camera/fisheye2/camera_info_calib

roslaunch rtabmap_ros rtabmap.launch \
   args:="-d --Rtabmap/ImagesAlreadyRectified false" \
   stereo:=true \
   left_image_topic:=/camera/fisheye1/image_raw \
   right_image_topic:=/camera/fisheye2/image_raw \
   left_camera_info_topic:=/camera/fisheye1/camera_info_calib \
   right_camera_info_topic:=/camera/fisheye2/camera_info_calib \
   visual_odometry:=false \
   odom_frame_id:=camera_odom_frame

rosrun rtabmap_ros rtabmap -d \
   --Rtabmap/ImagesAlreadyRectified false \
   --Rtabmap/DetectionRate 0 \
   _subscribe_depth:=false \
   rgb/image:=/camera/fisheye1/image_raw \
   rgb/camera_info:=/camera/fisheye1/camera_info_calib \
   _odom_frame_id:=camera_odom_frame \
   _frame_id:=camera_pose_frame

rosrun rtabmap_ros rtabmapviz _odom_frame_id:=camera_odom_frame

ROS_NAMESPACE=my_stereo rosrun stereo_image_proc stereo_image_proc \
    left/image_raw:=/camera/fisheye1/image_raw \
    right/image_raw:=/camera/fisheye2/image_raw \
    left/camera_info:=/camera/fisheye1/camera_info_calib \
    right/camera_info:=/camera/fisheye2/camera_info_calib \
    __ns:=stereo \
    _approximate_sync:=true

rosrun image_view image_view image:=/stereo/left/image_rect_color

# roslaunch rtabmap_ros euroc_datasets.launch args:="Odom/Strategy 9 OdomVINS/ConfigPath /home/d3dx13/vins-application/t265_config.yaml" MH_seq:=true raw_images_for_odom:=true


rm -rf ~/AquilaBuild