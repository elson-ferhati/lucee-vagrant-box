#!/bin/bash

DOMAIN_NAME=$1
DOCUMENT_ROOT=$2

APACHE_SITE="$DOMAIN_NAME.conf"
VIRTUAL_HOST_CONF="/vagrant/bash-scripts/virtual-host/virtual-host.conf"

APACHE_SITES_CONF="/etc/apache2/sites-available/$APACHE_SITE"

echo "BEGIN Setting Up Virtual Host $DOMAIN_NAME ..."

echo " "

if [ ! -d "$DOCUMENT_ROOT" ]; then
	echo "Creating domain directory $DOCUMENT_ROOT..."

	# Create the domain directory
	sudo mkdir $DOCUMENT_ROOT

	# Assign ownership of the directory with the $USER environment variable:
	sudo chown -R $USER:$USER $DOCUMENT_ROOT

	# Allow the owner to read, write, and execute the files while granting only read and execute permissions to groups and others
	sudo chmod -R 755 $DOCUMENT_ROOT

sudo cat <<EOT > $DOCUMENT_ROOT/index.html
	<html>
		<head>
			<title>Welcome to $DOMAIN_NAME!</title>
		</head>
		<body>
			<h1>Success! The $DOMAIN_NAME virtual host is working!</h1>
		</body>
	</html>
EOT

fi

echo "Adding apache2/sites-available conf ..."
{
	echo "Define DOMAIN_NAME $DOMAIN_NAME"
	echo "Define DOCUMENT_ROOT $DOCUMENT_ROOT"
	echo " "
} > $APACHE_SITES_CONF

sudo cat $VIRTUAL_HOST_CONF >> $APACHE_SITES_CONF

echo "a2ensite $APACHE_SITE ..."
sudo a2ensite $APACHE_SITE &> /dev/null
sudo systemctl reload apache2

echo "apache2ctl configtest ..."
sudo apache2ctl configtest


echo "... END Setting Up Virtual Host"
echo " "