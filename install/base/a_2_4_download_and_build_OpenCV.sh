#!/bin/bash

OPENCV_VERSION=3.4.14
ARCH_BIN=6.1
INSTALL_DIR=/usr
DOWNLOAD_OPENCV_EXTRAS=YES
OPENCV_SOURCE_DIR=~/AquilaBuild
WHEREAMI=$PWD
NUM_JOBS=$(nproc)
CLEANUP=true
PACKAGE_OPENCV="-D CPACK_BINARY_DEB=ON"
CMAKE_INSTALL_PREFIX=$INSTALL_DIR

cd $OPENCV_SOURCE_DIR

wget -O opencv.zip https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
wget -O opencv_extra.zip https://github.com/opencv/opencv_extra/archive/${OPENCV_VERSION}.zip
unzip opencv.zip
unzip opencv_contrib.zip
unzip opencv_extra.zip

cd $OPENCV_SOURCE_DIR
sudo cp -rf opencv-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}
CUR_USER=$(whoami)
sudo chown -R $CUR_USER /opt/opencv-${OPENCV_VERSION}
cp -rf opencv_extra-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}/opencv_extra-${OPENCV_VERSION}
cp -rf opencv_contrib-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}/opencv_contrib-${OPENCV_VERSION}
sudo chown -R $CUR_USER /opt/opencv-${OPENCV_VERSION}

cd /opt/opencv-${OPENCV_VERSION}
mkdir build
cd build

rm -rf *

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D WITH_CUDA=ON \
      -D CUDA_ARCH_BIN=${ARCH_BIN} \
      -D CUDA_ARCH_PTX="" \
      -D ENABLE_FAST_MATH=ON \
      -D CUDA_FAST_MATH=ON \
      -D WITH_CUDNN=ON \
      -D OPENCV_DNN_CUDA=ON \
      -D CUDNN_INCLUDE_DIR=/usr/lib/x86_64-linux-gnu \
      -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.8 \
      -D WITH_CUBLAS=ON \
      -D WITH_LIBV4L=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
      -D BUILD_opencv_python2=ON \
      -D PYTHON2_EXECUTABLE=/usr/bin/python2.7 \
      -D PYTHON2_PACKAGES_PATH=/usr/lib/python2.7/dist-packages \
      -D PYTHON2_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython2.7.so \
      -D BUILD_opencv_python3=ON \
      -D PYTHON3_EXECUTABLE=/usr/bin/python3.6 \
      -D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
      -D PYTHON3_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.6m.so \
      -D BUILD_TESTS=ON \
      -D BUILD_PERF_TESTS=ON \
      -D BUILD_DOCS=ON \
      -D BUILD_EXAMPLES=ON \
      -D INSTALL_TESTS=ON \
      -D OPENCV_TEST_DATA_PATH=/opt/opencv-${OPENCV_VERSION}/opencv_extra-${OPENCV_VERSION}/testdata \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/opt/opencv-${OPENCV_VERSION}/opencv_contrib-${OPENCV_VERSION}/modules \
      -D OPENCV_ENABLE_NONFREE=ON \
      $"PACKAGE_OPENCV" \
      ..


make -j$NUM_JOBS
sudo make -j$NUM_JOBS install
sudo ldconfig

cd /opt/opencv-${OPENCV_VERSION}/samples
sed -i 's/# add_subdirectory(gpu)/add_subdirectory(gpu)/' CMakeLists.txt
cmake .
make -j$NUM_JOBS -i

sudo sed -i 's/SET(OpenCV_VERSION 3.2.0)/SET(OpenCV_VERSION 3.4.14)/' /usr/share/OpenCV/OpenCVConfig.cmake

