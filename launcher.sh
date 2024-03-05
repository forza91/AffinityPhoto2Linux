#!/usr/bin/env bash

pwd
APP_PATH=$PWD/affinity
export WINEPREFIX=$APP_PATH
echo $WINEPREFIX
export PATH=$PWD/ElementalWarrior-wine/wine-install/bin:$PATH
echo "Checking wine version..."
wine --version

WINEPREFIX=$APP_PATH DXVK_LOG_PATH=$APP_PATH DXVK_STATE_CACHE_PATH=$APP_PATH LANGUAGE=en_US wine  $APP_PATH/drive_c/Program\ Files/Affinity/Photo\ 2/Photo.exe
