#! /bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install build-essential gcc make perl dkms git vim lib32ncurses5-dev libreadline-dev libx11-dev cmake

# 安裝配置ssh
sudo apt-get install openssh-client
sudo apt-get install openssh-server
sudo /etc/init.d/ssh restart