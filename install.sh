#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get update


# Change hostname
sudo hostnamectl set-hostname T1FT

# Software used to use nslookup and a lot of services network
sudo apt-get install net-tools

# Intall Ibus-Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
ibus restart

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

# Install Curl
sudo apt-get install curl

# Install Valgrind - Tool check memory leak
sudo apt-get install valgrind

# Install Multi Terminal - Can devide screen into some parts
sudo apt-get install terminator

# Install John the Ripper
sudo apt-get -y install john
