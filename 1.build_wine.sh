#!/usr/bin/env bash
tty -s || exec gnome-terminal -- $0 "$@"

#Refering to https://github.com/daniel080400/AffinityLinuxTut

pwd

echo "================================================="
echo "A shell script to build wine-affinity in Linux"
echo "Tested in Debian12 only"
echo "================================================="
echo "Press Enter to continue..."
read  alert

pwd
sudo apt install git
sudo apt install libvulkan1
sudo apt install gcc flex bison
sudo apt install libx11-dev:i386 libfreetype6-dev:i386
sudo apt install gcc-multilib gcc-mingw-w64 libasound2-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libgnutls28-dev libgl-dev libunwind-dev libx11-dev libxcomposite-dev libxcursor-dev libxfixes-dev libxi-dev libxrandr-dev libxrender-dev libxext-dev
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libosmesa6-dev libsdl2-dev libvulkan-dev
sudo apt-get install cabextract


echo "Cloning the ElementalWarrior-wine..."
if [ -d ElementalWarrior-wine ]; then
    echo "Folder exists!"
else
    git clone -b affinity-photo2-wine8.14 https://gitlab.winehq.org/ElementalWarrior/wine.git ElementalWarrior-wine
fi

cd ElementalWarrior-wine
PARENT_PATH=$(dirname "$PWD")

if [ ! -d wine32-build ]; then
	mkdir wine32-build/
fi
if [ ! -d wine64-build ]; then
	mkdir wine64-build/
fi
if [ ! -d wine-install ]; then
	mkdir wine-install/
fi

cd wine64-build
PARENT_PATH=$(dirname "$PWD")
$PARENT_PATH/configure --prefix=$PARENT_PATH/wine-install --enable-win64
make -j 8
cd ..

cd wine32-build
PARENT_PATH=$(dirname "$PWD")
PKG_CONFIG_PATH=/usr/lib32/pkgconfig $PARENT_PATH/configure --with-wine64=$PARENT_PATH/wine64-build --prefix=$PARENT_PATH/wine-install
make -j 8
make install
cd ..

cd wine64-build
make install
cd ..

#out to sh path
cd ..

echo "==================================================="
echo "Successfully build wine at ./ElementalWarrior-wine/win-install"
echo "Please reboot and run the 2.install_affinity.sh"
echo "==================================================="


read -p ""
