#!/bin/bash
cd ~/AquilaUAV_pc
rm -rf installing_queue
mkdir installing_queue
cd install
for i in $(ls -d */)
do
    cp -rf ${i%%/}/* ../installing_queue
    echo Loading: ${i%%/}
done

echo
echo "Installation order:"
ls -1 ~/AquilaUAV_pc/installing_queue/
echo

cd ~/AquilaUAV_pc
read -p "Please confirm the installation order is correct [y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    bash -c "$(<install/install_step)"
else
    rm -rf installing_queue
fi

