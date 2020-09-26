#! /bin/sh

set -e

PKG='packages-microsoft-prod.deb'

mkdir -p data
wget https://packages.microsoft.com/config/ubuntu/18.04/"$PKG" -O data/"$PKG"
sudo apt install ./data/"$PKG"
sudo apt update
sudo apt install apt-transport-https
sudo apt update
sudo apt install dotnet-sdk-3.1
