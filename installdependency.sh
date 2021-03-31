#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo usermod -aG docker $USER
sudo apt-get install -y python3 python3-pip
pip3 install --user docker-compose

echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.profile
#if use wsl on windows
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
sudo cp ./etc/wsl.conf /etc/wsl.conf

sudo apt-get install git
cd /home/$USER
pwd
mkdir 'chainid-env'
cd /home/$USER/chainid-env
git clone https://github.com/bcgov/von-network.git
git clone https://github.com/hyperledger/aries-cloudagent-python.git
