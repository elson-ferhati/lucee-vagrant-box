#!/bin/bash

echo "BEGIN Installing Nodejs ..."

sudo apt install -y nodejs &> /dev/null

echo "nodejs -v ..."
sudo nodejs -v

echo " "

echo "Installing npm ..."
sudo apt install -y npm &> /dev/null

echo "npm -v ..."
sudo npm -v

echo "... END Installing Nodejs"
echo " "