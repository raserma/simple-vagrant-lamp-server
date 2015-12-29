#!/usr/bin/env bash

# Environment variables
PASSWORD_ROOT='1234'
PROJECTFOLDER='src'

# Update repo
# sudo yum -y update

# Install apache server
sudo yum install -y httpd httpd-devel

# Configure apache: ServerName
echo "ServerName 127.0.0.1:8080" >> /etc/httpd/conf/httpd.conf

# Install MySQL DB server
sudo yum install -y mysql mysql-server mysql-devel

# Start MySQL Deamon
/etc/init.d/mysqld start

# Configure MySQL DB: add root passwd
sudo mysqladmin -u root password ${PASSWORD_ROOT} 

# Flush privileges
sudo mysql -u root -p${PASSWORD_ROOT} -e 'FLUSH PRIVILEGES';

# Create new user guest on demo db
sudo mysql -u root -p${PASSWORD_ROOT} -e "USE mysql; create database demo; GRANT ALL PRIVILEGES ON demo.* TO 'guest'@'localhost' IDENTIFIED BY 'guest' WITH GRANT OPTION; UPDATE user SET Password=PASSWORD('guest') WHERE user='guest';" 

# Restart MySQL deamon
/etc/init.d/mysqld restart

# Install PHP5 Language
sudo yum install -y php php-mysql php-common php-gd php-mbstring php-mcrypt php-devel php-xml

# Configure PHP
if [ ! -h /var/www ]; 
then 
    rm -rf /var/www/html 
    ln -s /vagrant/${PROJECTFOLDER} /var/www/html
    sed -i '/AllowOverride None/c AllowOverride All' /etc/httpd/conf/httpd.conf
    sudo /etc/init.d/httpd restart
fi

# Install phpmyadmin
sudo yum install -y phpmyadmin

# Configure phpMyAdmin conf file
sed -i '/Deny from All/c Allow from All' /etc/httpd/conf.d/phpMyAdmin.conf
sed -i '/Allow from None/c Allow from All' /etc/httpd/conf.d/phpMyAdmin.conf
sed -i '/Order Deny,Allow/c Order Allow,Deny' /etc/httpd/conf.d/phpMyAdmin.conf

# Restart httpd
sudo /etc/init.d/httpd restart
