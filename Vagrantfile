### BEGIN BOX Configuration Parameters ... ###

BOX_BASE = "ubuntu/focal64"
BOX_HOSTNAME = "dev.lucee.com"

BOX_TIMEZONE = "Europe/Rome"

BOX_RAM_MB = 4096
BOX_CPU_COUNT = 2
BOX_CPU_CAP = 100

LUCEE_VERSION="5.3.5.092"
LUCEE_WEB_PASS="AA11BB22"

BOX_DOMAIN_NAME = "dev.lucee.com"
BOX_DOMAIN_DIRECTORY = "/var/www/dev.lucee.com"

### ... END BOX Configuration Parameters ###

Vagrant.configure("2") do |config|

	config.vm.box = BOX_BASE
	config.vm.boot_timeout = 300
	config.vm.hostname = BOX_HOSTNAME

	# config.vm.box_check_update = false

	# Create a forwarded port mapping. Accessing "localhost:8080" will access port 80 on the guest machine.
	# config.vm.network "forwarded_port", guest: 80, host: 8080

	# Create a forwarded port mapping. only allow access via 127.0.0.1 to disable public access
	# config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

	# Create a public network. Bridged network
	# config.vm.network "public_network"

	# Create a private network, which allows host-only access to the machine using a specific IP.
	config.vm.network "private_network", ip: "192.168.2.100"

	config.vm.provider "virtualbox" do |vb|
		vb.name = "Lucee-Vagrant-Box"

		# Display the VirtualBox GUI when booting the machine
		# vb.gui = true

		# Use VBoxManage to customize the VM. For example to change memory:
		vb.customize ["modifyvm", :id, "--memory", BOX_RAM_MB]
		vb.customize ["modifyvm", :id, "--cpus", BOX_CPU_COUNT]
		vb.customize ["modifyvm", :id, "--cpuexecutioncap", BOX_CPU_CAP]

		# vb.customize ["modifyvm", :id, "--vram", 16]

		# Using the host's resolver as a DNS proxy in NAT mode
		# vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

		vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
		vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
		vb.customize ["modifyvm", :id, "--nestedpaging", "off"]

	end

	# Sync the www/ folder within the vagrant folder
	config.vm.synced_folder "www/", "/var/www/", :mount_options => ["dmode=755,fmode=755"]

	config.vm.provision :shell, :path => "bash-scripts/packages/step-1-update-packages.sh", :privileged => true
	config.vm.provision :shell, :path => "bash-scripts/packages/step-2-installing-utilities.sh", :privileged => true, :args => BOX_TIMEZONE
	config.vm.provision :shell, :path => "bash-scripts/packages/step-3-installing-apache.sh", :privileged => true
	config.vm.provision :shell, :path => "bash-scripts/packages/step-4-installing-lucee.sh", :privileged => true, :args => [ LUCEE_VERSION, LUCEE_WEB_PASS ]
	config.vm.provision :shell, :path => "bash-scripts/packages/step-5-installing-nodesjs.sh", :privileged => true

	config.vm.provision "shell", :path => "bash-scripts/virtual-host/setting-domain.sh", :privileged => true, :args => [ BOX_DOMAIN_NAME, BOX_DOMAIN_DIRECTORY ]

	# shell inline
	# config.vm.provision "shell", inline: <<-SHELL
	#   apt-get update
	#   apt-get install -y apache2
	# SHELL
end
