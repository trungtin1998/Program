 
#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get update

# Change hostname
sudo hostnamectl set-hostname T1FT

# Install Nix note 2
sudo add-apt-repository ppa:nixnote/nixnote2-daily
sudo apt update; sudo apt install nixnote2

# Python
sudo apt-get install python python3

# Software used to use nslookup and a lot of services network
sudo apt-get install net-tools

# Install Tweak - manage theme
sudo apt install gnome-tweaks

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

# Install Curl
sudo apt-get install curl

# Install Terminal - devides screen into some parts
sudo apt-get install terminator

# Install Super Productivity - manage projects
sudo snap install superproductivity
