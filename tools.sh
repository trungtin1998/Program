# Create GIT directory
cd ~
mkdir GIT
cd GIT

###################################################### Pentest tool ######################################################

################## Gobuster ##################
# Find files and directories during the recon phase
git clone https://github.com/OJ/gobuster.git
# Make sure you have Go and create param GOPATH
go get github.com/OJ/gobuster
go get && go build
go install
## Using
# Dir mode: Find all files as well as folders of this 
# gobuster dir -u YOUR_WEBSITE_TARGET -w PAHT_TO_WORDLIST -v
# DNS mode: Find all subdomains of website
# gobuster dns -d YOUR_WEBSITE_TARGET -w PAHT_TO_WORDLIST


################## XSSSNIPPER ##################
# Find XSS vulnerability automatically by using some XSS plugins
git clone https://github.com/gbrindisi/xsssniper.git
## Using
# python xsssniper.py -u 'YOUR_WEBSITE_TARGET' --crawl --forms


################## Brutespray ##################
# Brute force all ports that website is using
sudo apt-get install brutespray


################## Grabber ##################
# Detect many security vulnerabilities in web applications.
# It performs scans and tells where the vulnerability exists. It can detect the following vulnerabilities:
  # Cross site scripting
  # SQL injection
  # Ajax testing
  # File inclusion
  # JS source code analyzer
  # Backup file check
git clone https://github.com/neuroo/grabber.git


################## Metasploit ##################
# Having more features to scan vulnerable web applications.
# Installing oracle java 8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer
# Installing dependencies
sudo apt-get install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev curl zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr
# Installing Ruby
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
ruby -v
# Installing Nmap
git clone https://github.com/nmap/nmap.git
cd nmap 
./configure
make
sudo make install
make clean
cd ~/GIT/
# Installing metasploit
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R `whoami` ./metasploit-framework
cd metasploit-framework
# If using RVM set the default gem set that is create when you navigate in to the folder
rvm --default use ruby-${RUBYVERSION}@metasploit-framework
gem install bundler
bundle install
sudo bash -c 'for MSF in $(ls msf*); do ln -s ~/GIT/metasploit-framework/$MSF /usr/local/bin/$MSF;done'




