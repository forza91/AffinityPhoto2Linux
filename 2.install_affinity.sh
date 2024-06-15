#!/usr/bin/env bash
tty -s || exec gnome-terminal -- $0 "$@"

#Refering to https://github.com/daniel080400/AffinityLinuxTut
pwd

echo "================================================="
echo "A shell script to build Affinity 2 in Linux"
echo "Tested in Debian12 only"
echo "================================================="
echo "Press Enter to continue..."
read  alert

##add wine path which just installed
export PATH=$PWD/ElementalWarrior-wine/wine-install/bin:$PATH

echo "Creating folder for Affinity app...[./affinity]"
if [ ! -d affinity ]; then
	mkdir affinity
fi

##init wine environment
chmod +x ./winetricks
WINEPREFIX=$PWD/affinity ./winetricks dotnet48 corefonts vcrun2015 renderer=vulkan
WINEPREFIX=$PWD/affinity winecfg -v win11

##copy meta
tar -xvf ./WinMetadata.tar.xz
cp -r ./WinMetadata/ ./affinity/drive_c/windows/system32/
rm -rf /WinMetadata

##install affinity photo
WINEPREFIX=$PWD/affinity wine affinity-photo-msi-2.4.0.exe

chmod +x ./launcher.sh


echo "=============================================="
echo "Success!"
read -p ""
