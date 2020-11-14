#!/bin/bash

echo "BEGIN Update packages ..."

sudo apt -y update &> /dev/null
sudo apt -y upgrade &> /dev/null

echo "... END Update packages"
echo " "