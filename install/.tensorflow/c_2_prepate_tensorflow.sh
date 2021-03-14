#!/bin/bash

sudo apt-get install -y openjdk-8-jdk

sudo apt install -y python3-dev python3-pip
sudo apt install -y python-dev python-pip

python -m pip install -U --user pip numpy wheel
python -m pip install -U --user keras_preprocessing --no-deps
python3 -m pip install -U --user pip numpy wheel
python3 -m pip install -U --user keras_preprocessing --no-deps

python -m pip install --user grpcio h5py keras_applications keras_preprocessing mock numpy requests future
python3 -m pip install --user grpcio h5py keras_applications keras_preprocessing mock numpy requests future

sudo apt install -y curl gnupg
sudo apt-get install -y pkg-config zip g++ zlib1g-dev unzip python

BAZEL_VESRION=0.27.1

rm -rf ~/.bazel/
cd $(xdg-user-dir DOWNLOAD)
wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VESRION}/bazel-${BAZEL_VESRION}-installer-linux-x86_64.sh
chmod +x bazel-${BAZEL_VESRION}-installer-linux-x86_64.sh
./bazel-${BAZEL_VESRION}-installer-linux-x86_64.sh --user
sudo mv bin/bazel /usr/local/bin/
rm -rf bin
rm -rf bazel-${BAZEL_VESRION}-installer-linux-x86_64.sh

rm -rf ~/AquilaBuild
mkdir ~/AquilaBuild
cd ~/AquilaBuild
git clone https://github.com/tensorflow/tensorflow.git --branch r2.1

cd ~/AquilaBuild/tensorflow

sed -i 's/header_path, header_version = _find_header(base_paths, "cudnn.h",/header_path, header_version = _find_header(base_paths, "cudnn_version.h",/g' third_party/gpus/find_cuda_config.py

sed -i "s/tuple(line.decode('ascii').rstrip().split(': ')) for line in proc.stdout/[tuple(line.decode('ascii').rstrip().split(': ')) for line in proc.stdout]/g" configure.py

cd ~/AquilaBuild/tensorflow
clear
echo
echo "Correct answers are (Enter = just press Enter):"
echo
echo "/usr/bin/python"
echo "/usr/lib/python2.7/dist-packages"
echo "Y"
echo "N"
echo "N"
echo "Y"
echo "Y"
echo "Enter"
echo "N"
echo "Enter"
echo "Enter"
echo "N"
echo
./configure

bazel clean
bazel build --config=opt --config=cuda --action_env PATH --action_env LD_LIBRARY_PATH --action_env DYLD_LIBRARY_PATH //tensorflow/tools/pip_package:build_pip_package

./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

python -m pip install /tmp/tensorflow_pkg/tensorflow-version-tags.whl --user

