#!/bin/bash

echo "BEGIN Installing Lucee ..."

LUCEE_VERSION=$1
LUCEE_WEB_PASS=$2

echo "Download Lucee $LUCEE_VERSION"
sudo wget -O /tmp/lucee-$LUCEE_VERSION-pl0-linux-x64-installer.run https://cdn.lucee.org/lucee-$LUCEE_VERSION-pl0-linux-x64-installer.run &> /dev/null

# Set the executable permission:
sudo chmod +x /tmp/lucee-$LUCEE_VERSION-pl0-linux-x64-installer.run


echo "Installing Lucee $LUCEE_VERSION"
sudo /tmp/lucee-$LUCEE_VERSION-pl0-linux-x64-installer.run --mode unattended --luceepass "$LUCEE_WEB_PASS" --installiis false &> /dev/null

echo "systemctl status lucee_ctl"
sudo systemctl status lucee_ctl
echo " "

echo "... END Installing Lucee"
echo " "