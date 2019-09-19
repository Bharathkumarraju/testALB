#!/bin/bash
yum install httpd -y
mkdir /var/www/html/hello
echo 'Hi Hello world!' > /var/www/html/hello/index.html
service httpd start
