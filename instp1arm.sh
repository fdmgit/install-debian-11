#!/bin/bash

apt update

###################################
#### Install updated Debian Version
###################################

apt upgrade -y 
apt install plocate sntp ntpdate software-properties-common -y 
hostnamectl set-hostname $2

##############################
#### Change MariaDB repository
##############################
#apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
#add-apt-repository 'deb [arch=ppc64el,amd64,arm64] https://mirror.mva-n.net/mariadb/repo/10.5/ubuntu focal main' 

apt update 
#passwd root
echo "root:$1" | chpasswd   # set root password -


##############################
#### Install Virtualmin
##############################

wget -O virtualmin-install_arm.sh https://raw.githubusercontent.com/fdmgit/install-debian/main/virtualmin-install_arm.sh
sh virtualmin-install_arm.sh -y
reboot