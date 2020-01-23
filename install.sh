#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get update

# Install nvidia card
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-430 nvidia-setting

# Change hostname
sudo hostnamectl set-hostname T1FT

# Python
sudo apt-get install python python3

# Pip
sudo apt-get install pip pip3

# Software used to use nslookup and a lot of services network
sudo apt-get install net-tools

# Install Tweak - manage theme
sudo apt install gnome-tweaks

# Intall Ibus-Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
ibus restart

# Install Vim
sudo apt-get install vim

# Install Sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text

# Install VMware
wget -O ~/vmware.bin https://www.vmware.com/go/getWorkstation-linux
sudo apt -y install build-essential
sudo bash ~/vmware.bin

# Install Wireshark
sudo apt-get install wireshark
sudo groupadd wireshark
sudo usermod -a -G wireshark trungtin
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
sudo getcap /usr/bin/dumpcap

# Install GNS3
sudo add-apt-repository ppa:gns3/ppa
sudo apt-get update
sudo apt-get install gns3-gui
sudo dpkg –add-architecture i386
sudo apt-get update
sudo apt-get install gns3-iou

# Install Rar and Unrar
sudo apt-get install rar unrar

# Install Curl
sudo apt-get install curl

# Install Valgrind - Tool check memory leak
sudo apt-get install valgrind

# Install Multi Terminal - Can devide screen into some parts
sudo apt-get install terminator

# Install John the Ripper - Crack password
sudo apt-get -y install john

# Install Super Productivity - manage projects
sudo snap install superproductivity

# Install Wallch - change Wallpaper follow time
sudo apt-get install wallch

# Install Nixnote2 - Application is same as Microsoft One Note - Evernote on Linux  
sudo add-apt-repository ppa:nixnote/nixnote2-daily
sudo apt-get install nixnote2 -y

# Install JAVA
sudo apt-get install -y default-jdk
sudo apt-get install -y default-jre
## Downloads Burpsuite and executes bash shell file
