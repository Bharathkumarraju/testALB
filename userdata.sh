#!/bin/bash
yum install httpd -y
echo 'Hello world!' > /var/www/html/index.html
service httpd start
