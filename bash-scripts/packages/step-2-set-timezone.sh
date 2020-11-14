#!/bin/bash

echo "BEGIN Set VM timezone ..."

sudo timedatectl set-timezone $1

sudo apt install ntp -y &> /dev/null

echo "timedatectl ...."
sudo timedatectl

echo "... END Set VM timezone"
echo " "