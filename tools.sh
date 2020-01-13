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
# gobuster dir -u https://buffered.io -w ~/wordlists/shortlist.txt -v
# DNS mode: Find all subdomains of website
# gobuster dns -d google.com -w ~/wordlists/subdomains.txt

