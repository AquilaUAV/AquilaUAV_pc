#!/bin/bash


OPENCV_VERSION=4.5.1
ARCH_BIN=5.3
INSTALL_DIR=/usr/local
DOWNLOAD_OPENCV_EXTRAS=YES
OPENCV_SOURCE_DIR=~/AquilaBuild
WHEREAMI=$PWD
NUM_JOBS=$(nproc)
CLEANUP=true
PACKAGE_OPENCV="-D CPACK_BINARY_DEB=ON"
CMAKE_INSTALL_PREFIX=$INSTALL_DIR

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}
sed -i 's/include <Eigen\/Core>/include <eigen3\/Eigen\/Core>/g' modules/core/include/opencv2/core/private.hpp
cd $OPENCV_SOURCE_DIR

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}
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
      -D OpenCL_INCLUDE_DIR=/usr/local/cuda/include/ \
      -D OpenCL_LIBRARY=/usr/local/cuda-10.2/lib64/libOpenCL.so \
      -D CUDNN_INCLUDE_DIR=/usr/local/cuda/include \
      -D CUDNN_LIBRARY=/usr/lib/x86_64-linux-gnu/libcudnn.so.8.1.1 \
      -D CUDNN_VERSION='8.1.1' \
      $"PACKAGE_OPENCV" \
      ..


make -j$NUM_JOBS
sudo make install
sudo ldconfig

cd $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}/samples
cmake .
make -j$NUM_JOBS
sudo make install

cd /usr/lib/python3.6/lib-dynload
sudo ln -s /usr/lib/python3.6/dist-packages/cv2/python-3.6/cv2.cpython-36m-x86_64-linux-gnu.so
cd /usr/lib/python2.7/lib-dynload
sudo ln -s /usr/lib/python2.7/dist-packages/cv2/python-2.7/cv2.so

