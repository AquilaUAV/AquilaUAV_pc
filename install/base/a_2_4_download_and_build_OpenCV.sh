#!/bin/bash


OPENCV_VERSION=3.2.0
ARCH_BIN=5.3
INSTALL_DIR=/usr/local
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

## --> https://www.programmersought.com/article/58866954910/
# d $OPENCV_SOURCE_DIR/opencv-${OPENCV_VERSION}
# sed -i 's/include <Eigen\/Core>/include <eigen3\/Eigen\/Core>/g' modules/core/include/opencv2/core/private.hpp

cd $OPENCV_SOURCE_DIR
sudo cp -rf opencv-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}
sudo chown -R $(whoami) /opt/opencv-${OPENCV_VERSION}
cp -rf opencv_extra-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}/opencv_extra-${OPENCV_VERSION}
cp -rf opencv_contrib-${OPENCV_VERSION} /opt/opencv-${OPENCV_VERSION}/opencv_contrib-${OPENCV_VERSION}

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
      -D WITH_CUBLAS=ON \
      -D WITH_LIBV4L=ON \
      -D ENABLE_NEON=ON \
      -D WITH_V4L=ON \
      -D WITH_VTK=ON \
      -D WITH_GSTREAMER=ON \
      -D WITH_GSTREAMER_0_10=OFF \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D BUILD_opencv_python2=ON \
      -D PYTHON3_EXECUTABLE=/usr/bin/python2.7 \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python2.7/dist-packages/numpy/core/include/ \
      -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python2.7/dist-packages \
      -D PYTHON3_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython2.7m.so \
      -D BUILD_opencv_python3=ON \
      -D PYTHON3_EXECUTABLE=/usr/bin/python3.6 \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.6/dist-packages/numpy/core/include/ \
      -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.6/dist-packages \
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
sudo make install
sudo ldconfig

cd /opt/opencv-${OPENCV_VERSION}/samples
cmake .
make -j$NUM_JOBS

cd /usr/lib/python3.6/lib-dynload
sudo ln -s /usr/lib/python3.6/dist-packages/cv2/python-3.6/cv2.cpython-36m-x86_64-linux-gnu.so
cd /usr/lib/python2.7/lib-dynload
sudo ln -s /usr/lib/python2.7/dist-packages/cv2/python-2.7/cv2.so

