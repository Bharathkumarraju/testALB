#!/bin/bash
yum install httpd -y
service httpd start
mkdir /var/www/html/hello
echo 'Hello world!' > /var/www/html/hello/index.html