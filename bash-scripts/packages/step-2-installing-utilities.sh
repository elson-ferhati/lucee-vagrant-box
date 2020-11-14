#!/bin/bash

echo "BEGIN Installing utilities ..."

sudo timedatectl set-timezone $1

sudo apt install ntp -y &> /dev/null

echo "timedatectl ...."
sudo timedatectl

echo " "

echo "Setting PermitRootLogin ..."

# Changing PermitRootLogin and PasswordAuthentication
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart ssh

# Settting a password for root user
echo -e "root\nroot" | passwd root

echo "... END Installing utilities"
echo " "
