#!/bin/bash
cd ~/AquilaUAV_pc
if [ -d "install/${1}" ] && [ "${1}" != "" ]; then
    echo "Package found. Starting installation..."
    rm -rf installing_queue
    mkdir installing_queue
    cp -rf install/${1}/* installing_queue
    echo "[Desktop Entry]" > ~/.config/autostart/AquilaUAV_installation.desktop
    echo "Name=AquilaUAV_installation" >> ~/.config/autostart/AquilaUAV_installation.desktop
    echo "Exec=gnome-terminal -- bash -c '$(<install/install_step)'" >> ~/.config/autostart/AquilaUAV_installation.desktop
    echo "Type=Application" >> ~/.config/autostart/AquilaUAV_installation.desktop
    echo "Hidden=false" >> ~/.config/autostart/AquilaUAV_installation.desktop
    echo "NoDisplay=false" >> ~/.config/autostart/AquilaUAV_installation.desktop
    echo "X-GNOME-Autostart-enabled=true" >> ~/.config/autostart/AquilaUAV_installation.desktop
    bash -c "$(<install/install_step)"
else
    echo "There are no such package. Found:"
    cd install
    for i in $(ls -d */); do echo ${i%%/}; done
    cd ~/AquilaUAV_pc
fi

