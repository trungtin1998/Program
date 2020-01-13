# Make GIT directory
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
