# Install Shutter from APT
sudo apt-get install shutter -y

# Download 
cd ~/Downloads/
wget "https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas-common_1.0.0-1_all.deb"
wget "https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas3_1.0.0-1_amd64.deb"

sudo dpkg -i ~/Downloads/libgoocanvas-common_1.0.0-1_all.deb
sudo dpkg -i ~/Downloads/libgoocanvas3_1.0.0-1_amd64.deb
sudo apt-get -f install

wget "https://launchpad.net/ubuntu/+archive/primary/+files/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb"
sudo apt-get -f install

sudo apt-get -y install libappindicator-dev
sudo cpan -i Gtk2::AppIndicator
