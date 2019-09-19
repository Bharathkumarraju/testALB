#!/bin/bash
yum install httpd -y
echo 'Hello world!' > /var/www/html/index.html
service httpd start



#!/bin/bash
echo ECS_CLUSTER=acloudguru >> /etc/ecs/ecs.config