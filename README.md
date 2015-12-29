Vagrant LAMP stack
==================
It creates a simple LAMP (Linux, Apache, MySQL, PHP) stack by using Vagrant.
Vagrant allows creation and managing of VMs to be quickly setup and easy to use. 
Requirements
------------
* VirtualBox
* Vagrant
* Git

Usage
-----

### Setup

	$ git clone git@github.com:raserma/simple-vagrant-lamp-server.git
	$ cd simple-vagrant-lamp-server
	$ vagrant up
	$ vagrant ssh

### Connection

#### Apache
Apache server is available at http://localhost:8080

#### MySQL
username: root
password: 1234

username: guest
password: guest

#### MyPHPAdmin
myPhpAdmin is available at http://localhost:8080/myPhpAdmin

Technical Details
-----------------
* Cent0S 6.4 64 bit
* Apache/HTTPD
* PHP 5.1.6
* MySQL 5.1
* myPhpAdmin tool



