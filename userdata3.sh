#!/bin/bash
yum install httpd -y
mkdir /var/www/html/goodbye
echo 'Bye hello world!' > /var/www/html/goodbye/index.html
service httpd start