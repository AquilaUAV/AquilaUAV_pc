#!/bin/bash

cd ~/AquilaBuild

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

cd ~/AquilaUAV_pc
sudo cp cudnn_include/cudnn*.h /usr/local/cuda/include
sudo chmod a+r /usr/local/cuda/include/cudnn*.h
sudo dpkg -i dpkg/libcudnn8-samples_8.1.1.33-1+cuda10.2_amd64.deb
cd -

cp -r /usr/src/cudnn_samples_v8/ ~/AquilaBuild
cd ~/AquilaBuild/cudnn_samples_v8/mnistCUDNN
make clean && make
./mnistCUDNN

sudo reboot

