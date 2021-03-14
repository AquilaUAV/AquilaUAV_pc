#!/bin/bash

browse https://itsfoss.com/nvidia-optimus-support-linux/

browse https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/7.1/local_repo/nv-tensorrt-repo-ubuntu1804-cuda10.2-trt7.1.3.4-ga-20200617_1-1_amd64.deb

echo "                                                                    "
echo "                                                                    "
echo "                      Please, download this file                    "
echo "                  Upon completion of the download,                  "
echo "                the script will automatically continue              "
echo "    Nvidia does not want this file to be downloaded from the link   "
echo "               Nvidia requires logging into the system              "
echo "              and downloading the file from the browser             "
echo "                                                                    "
echo "            This is the only moment in the entire project           "
echo "                 that cannot be legally automated!                  "
echo "                                                                    "
echo "                                                                    "
echo "          _————             +--------------------------------------+"
echo "         //¯¯\\\\\\\\           |    _  _     _    _ _                 |"
echo "        // _  _\\\\           |   | \| |_ _(_)__| (_)__ _            |"
echo "        \\|(0)(0)\\           |   | .\` \\ V / / _\` | / _\` |_          |"
echo "        d  n ¨  b           |   |_|\\_|\\_/|_\\__,_|_\\__,_( )         |"
echo "         \\_U_^  /           |                          |/          |"
echo "         /   \\_/|_____      |       Nvidia,                        |"
echo "      ___\\   |__/\\    \\_    |          Fuck you!                   |"
echo "     /   |   / |:|      \\   |   ___        _                   _   |"
echo "    /    /  /\\ |:|     | \\  |  | __|  _ __| |__  _  _ ___ _  _| |  |"
echo "   |    /\\__/ \\|:\\     |  \\ |  | _| || / _| / / | || / _ \ || |_|  |"
echo "    \\  /\\   / ||: \\    \\  | |  |_| \\_,_\__|_\\_\\  \\_, \\___/\\_,_(_)  |"
echo "     \\/  \\_/  ||: |     |  \\|                    |__/              |"
echo "     /     /  //; \\     |  |+--------------------------------------+"
echo "     \\    /  /|;   \\    |  \\"

OS="ubuntu1804"
tag="cuda10.2-trt7.1.3.4-ga-20200617"

cd $(xdg-user-dir DOWNLOAD)

while [ ! -f nv-tensorrt-repo-${OS}-${tag}_1-1_amd64.deb ] 
do
    sleep 1
done

sudo dpkg -i nv-tensorrt-repo-${OS}-${tag}_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-${tag}/7fa2af80.pub

sudo apt-get update -y 
sudo apt-get install -y tensorrt

sudo apt-get install -y python-libnvinfer-dev
sudo apt-get install -y python3-libnvinfer-dev

dpkg -l | grep TensorRT
