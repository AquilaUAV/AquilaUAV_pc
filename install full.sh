# 0.1. По желанию установить нормальный браузер - google chrome
https://www.google.ru/intl/ru/chrome/

# 0.2. Удалить старый браузер:
sudo apt remove -y firefox

# 0.3. Настраиваем смену раскладки на ctrl+shift:
sudo apt-get install -y gnome-tweak-tool
gnome-tweaks

Обновление системы с перезагрузкой:
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo reboot

# 1.0 Установка драйверов nvidia
sudo apt install -y nvidia-driver-460
sudo reboot

# 1.1 Установка cuda toolkit (это займёт вечность, так как файл большой - 1.5Gb)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

sudo reboot

wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/1/cuda-repo-ubuntu1804-10-2-local_10.2.1-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local_10.2.1-1_amd64.deb

sudo reboot

wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/patches/2/cuda-repo-ubuntu1804-10-2-local_10.2.2-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-2-local_10.2.2-1_amd64.deb

sudo reboot

# 2.0 Установка ROS Melodic
cd ~
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update -y
sudo apt install -y ros-melodic-desktop-full
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt install -y python-rosdep
sudo rosdep init
rosdep update

# 2.1 Установка дров realsense2:
sudo apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u
sudo apt-get install -y librealsense2*

sudo reboot

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

# 3.0 Прелюдия к любви с OpenCV:
cd ~
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
cd ~
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y python3-dev python3-pip
sudo apt-get install -y python-dev python-pip
sudo apt-get install -y python3-testresources
sudo apt-get install -y python-testresources
pip install numpy
pip install pillow
pip install imutils
pip3 install numpy
pip3 install pillow
pip3 install imutils
sudo apt-get install -y libtbb-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libprotobuf-dev protobuf-compiler
sudo apt-get install -y libgoogle-glog-dev libgflags-dev
sudo apt-get install -y libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt-get install -y nvidia-opencl-dev
sudo apt-get install -y python-bs4
sudo apt-get install -y python3-bs4

# Установка CUDA
OS=ubuntu1804
cudnn_version=8.1.1.*
cuda_version=cuda10.2
wget https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/cuda-${OS}.pin 
sudo mv cuda-${OS}.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/${OS}/x86_64/ /"
sudo apt-get update
sudo apt-get install -y libcudnn8=${cudnn_version}-1+${cuda_version}
sudo apt-get install -y libcudnn8-dev=${cudnn_version}-1+${cuda_version}

cd ~
sudo cp cudnn_include/cudnn*.h /usr/local/cuda/include
sudo chmod a+r /usr/local/cuda/include/cudnn*.h
cd -

# Видимо, тут новые пакеты ставятся, хз.

sudo reboot

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

sudo reboot

sudo apt autoremove -y

# 3.1 Установка ENV и скачивание и установка и OpenCV:

OPENCV_VERSION=4.1.1
ARCH_BIN=5.3
INSTALL_DIR=/usr/local
DOWNLOAD_OPENCV_EXTRAS=YES
OPENCV_SOURCE_DIR=$HOME
WHEREAMI=$PWD
NUM_JOBS=$(nproc)
CLEANUP=true
PACKAGE_OPENCV="-D CPACK_BINARY_DEB=ON"
CMAKE_INSTALL_PREFIX=$INSTALL_DIR

wget -O opencv.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
wget -O opencv_extra.zip https://github.com/opencv/opencv_extra/archive/${OPENCV_VERSION}.zip
unzip opencv.zip
unzip opencv_contrib.zip
unzip opencv_extra.zip

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}
sed -i 's/include <Eigen\/Core>/include <eigen3\/Eigen\/Core>/g' modules/core/include/opencv2/core/private.hpp
cd $HOME

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D WITH_CUDA=ON \
      -D CUDA_ARCH_BIN=${ARCH_BIN} \
      -D CUDA_ARCH_PTX="" \
      -D ENABLE_FAST_MATH=ON \
      -D CUDA_FAST_MATH=ON \
      -D WITH_CUBLAS=ON \
      -D WITH_LIBV4L=ON \
      -D WITH_V4L=ON \
      -D WITH_GSTREAMER=ON \
      -D WITH_GSTREAMER_0_10=OFF \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D BUILD_opencv_python2=ON \
      -D BUILD_opencv_python3=ON \
      -D BUILD_TESTS=ON \
      -D BUILD_PERF_TESTS=ON \
      -D BUILD_DOCS=ON \
      -D BUILD_EXAMPLES=ON \
      -D INSTALL_TESTS=ON \
      -D OPENCV_TEST_DATA_PATH=$OPENCV_SOURCE_DIR/opencv_extra-${OPENCV_VERSION}/testdata \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_SOURCE_DIR/opencv_contrib-${OPENCV_VERSION}/modules \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D WITH_OPENGL=ON \
      -D BUILD_opencv_python2=ON \
      -D BUILD_opencv_python3=ON \
      -D OpenCL_INCLUDE_DIR=/usr/local/cuda/include/ \
      -D OpenCL_LIBRARY=/usr/local/cuda-10.2/lib64/libOpenCL.so \
      -D CUDNN_INCLUDE_DIR=/usr/local/cuda/include \
      -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.8.1.1 \
      -D CUDNN_VERSION='8.1.1' \
      -D Tesseract_LIBRARY=/usr/lib/x86_64-linux-gnu/libtesseract.so.4.0.0 \
      $"PACKAGE_OPENCV" \
      ..

# Consider the MAXN performance mode if using a barrel jack on the Nano
time make -j$NUM_JOBS
if [ $? -eq 0 ] ; then
  echo "OpenCV make successful"
else
  # Try to make again; Sometimes there are issues with the build
  # because of lack of resources or concurrency issues
  echo "Make did not build " >&2
  echo "Retrying ... "
  # Single thread this time
  make
  if [ $? -eq 0 ] ; then
    echo "OpenCV make successful"
  else
    # Try to make again
    echo "Make did not successfully build" >&2
    echo "Please fix issues and retry build"
    exit 1
  fi
fi

echo "Installing ... "
sudo make install
sudo ldconfig
if [ $? -eq 0 ] ; then
   echo "OpenCV installed in: $CMAKE_INSTALL_PREFIX"
else
   echo "There was an issue with the final installation"
   exit 1
fi

if [ "$PACKAGE_OPENCV" != "" ] ; then
   echo "Starting Packaging"
   sudo ldconfig  
   time sudo make package -j$NUM_JOBS
   if [ $? -eq 0 ] ; then
     echo "OpenCV make package successful"
   else
     # Try to make again; Sometimes there are issues with the build
     # because of lack of resources or concurrency issues
     echo "Make package did not build " >&2
     echo "Retrying ... "
     # Single thread this time
     sudo make package
     if [ $? -eq 0 ] ; then
       echo "OpenCV make package successful"
     else
       # Try to make again
       echo "Make package did not successfully build" >&2
       echo "Please fix issues and retry build"
       exit 1
     fi
   fi
fi

# check installation
IMPORT_CHECK="$(python -c "import cv2 ; print cv2.__version__")"
if [[ $IMPORT_CHECK != *$OPENCV_VERSION* ]]; then
  echo "There was an error loading OpenCV in the Python sanity test."
  echo "The loaded version does not match the version built here."
  echo "Please check the installation."
  echo "The first check should be the PYTHONPATH environment variable."
fi

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}/samples
cmake .
make
sudo make install


