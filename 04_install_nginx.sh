#!/bin/bash
setenforce 0 #I'm sorry Ishikawa-san

dnf -y install nginx
mkdir -p /usr/share/nginx/html/ipxe/
mkdir -p /usr/share/nginx/html/ocp/rhcos/ignitions
mkdir -p /usr/share/nginx/html/ocp/rhcos/images/latest
chmod -R 755 /usr/share/nginx/html/
cp -p ./etc_conf/nginx/nginx.conf /etc/nginx/nginx.conf
systemctl restart nginx
