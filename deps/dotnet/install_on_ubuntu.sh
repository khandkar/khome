#! /bin/sh

set -e

PKG_FILE='packages-microsoft-prod.deb'
PKG_NAME='dotnet-sdk-3.1=3.1.100-1'

mkdir -p data
wget https://packages.microsoft.com/config/ubuntu/18.04/"$PKG_FILE" -O data/"$PKG_FILE"
sudo apt install ./data/"$PKG_FILE"
sudo apt update
sudo apt install apt-transport-https
sudo apt update
sudo apt install "$PKG_NAME"
sudo apt-mark hold "$PKG_NAME"
