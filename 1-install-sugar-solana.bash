#!/bin/bash

#You may need to uncomment the line of code below to install additional dependencies depending on your OS set up
#sudo apt install libudev-dev pkg-config unzip

echo "Installing sugar cli"
bash <(curl -sSf https://sugar.metaplex.com/install.sh)

echo "Updating packages"
#The following two lines fix an issue with packaging in ubuntu 22.4
#https://stackoverflow.com/questions/72378647/spl-token-error-while-loading-shared-libraries-libssl-so-1-1-cannot-open-shar
#If link is expired you will need to grab a new url from http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/?C=M;O=D 
wget http://debian.mirror.ac.za/debian/pool/main/o/openssl/libssl1.1_1.1.1o-1_amd64.deb
sudo dpkg -i libssl1.1_1.1.1o-1_amd64.deb

echo "Sugar succesfully installed. Running --version check"
/home/ubuntu/bin/sugar --version

echo "Installing Solana stable version"
bash -c "$(curl -sSfL https://release.solana.com/stable/install)"

echo "solana installed. Updating PATH"
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"

echo "Solana succesfully installed. Running --version check"
solana --version