#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get update

# Install nvidia card
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-430 nvidia-setting
sudo prime-select intel

# Change hostname
sudo hostnamectl set-hostname T1FT

# Install GNOME Tweak - Change background and lockscreen
sudo add-apt-repository universe
sudo apt-get install gnome-tweak-tool

# Python
sudo apt-get install python python3

# Pip
sudo apt-get install python-pip python3-pip

# Software used to use nslookup and a lot of services network
sudo apt-get install net-tools

# Intall Ibus-Unikey
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install ibus-unikey
ibus restart

# Install Vim
sudo apt-get install vim

# Install Git
sudo apt-get install git

# Install Sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get -y install sublime-text

# Install VMware

# Install Rar and Unrar
sudo apt-get install rar unrar

# Install Curl
sudo apt-get install curl

# Install Multi Terminal - Can devide screen into some parts
sudo apt-get install terminator

# Install John the Ripper - Crack password
sudo apt-get -y install john


# Install JAVA
sudo apt-get install -y default-jdk
sudo apt-get install -y default-jre
## Downloads Burpsuite and executes bash shell file

# Save battery
# Install tlp and powertop
sudo apt-get install -y tlp powertop
sudo systemctl enable tlp
sudo systemctl start tlp
sudo systemctl enable tlp-sleep

### Disable Dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

### Change lockscreen: 
###### sudo gedit /usr/share/gnome-shell/theme/ubuntu.css
###### Lockscreen image: https://wallpapercave.com/wp/wp2019629.jpg

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
# Install Super Productivity - manage projects
sudo snap install superproductivity

# Install Wallch - change Wallpaper following real time
sudo apt-get install wallch

# Install Nixnote2 - Evernote's Desktop Application for Linux 
sudo add-apt-repository ppa:nixnote/nixnote2-daily
sudo apt-get install nixnote2 -y

# Install Valgrind - Tool check memory leak
sudo apt-get install valgrind
