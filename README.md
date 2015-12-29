Vagrant LAMP stack
==================
It creates a simple LAMP (Linux, Apache, MySQL, PHP) stack on Vagrant by using a provisioning script.

Vagrant is an open-source tool that creates and configures virtual development environments, in a quick and easy-to-use way.

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

#### phpMyAdmin
phpMyAdmin is available at http://localhost:8080/phpMyAdmin

Technical Details
-----------------
* Cent0S 6.4 64 bit
* Apache/HTTPD
* PHP 5.1.6
* MySQL 5.1
* phpMyAdmin tool



