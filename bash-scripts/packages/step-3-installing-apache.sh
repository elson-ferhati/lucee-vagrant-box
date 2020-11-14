#!/bin/bash

echo "BEGIN Installing apache ..."

sudo apt install apache2 -y &> /dev/null

echo "a2dissite 000-default ...." &&
sudo a2dissite 000-default.conf &> /dev/null
sudo systemctl reload apache2

if ! grep -q '^ServerName*' "/etc/apache2/apache2.conf"; then
	sudo cat /etc/apache2/apache2.conf >> "ServerName localhost"
fi

echo "systemctl status apache2 ...."
sudo systemctl status apache2

echo "... END Installing apache"
echo " "