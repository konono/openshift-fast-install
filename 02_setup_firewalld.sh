#!/bin/bash
firewall-cmd --list-all
firewall-cmd --list-all-zone
firewall-cmd --zone=public --add-port=5900-5910/tcp
firewall-cmd --zone=public --add-port=5900-5910/tcp --permanent
firewall-cmd --zone=public --add-port=6443/tcp
firewall-cmd --zone=public --add-port=6443/tcp --permanent
firewall-cmd --zone=public --add-port=22623/tcp
firewall-cmd --zone=public --add-port=22623/tcp --permanent
firewall-cmd --zone=public --add-port=80/tcp
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=libvirt --add-port=8000/tcp
firewall-cmd --zone=libvirt --add-port=8000/tcp --permanent
firewall-cmd --zone=libvirt --add-port=6443/tcp
firewall-cmd --zone=libvirt --add-port=6443/tcp --permanent
firewall-cmd --zone=libvirt --add-port=22623/tcp
firewall-cmd --zone=libvirt --add-port=22623/tcp --permanent
firewall-cmd --zone=libvirt --add-port=80/tcp
firewall-cmd --zone=libvirt --add-port=80/tcp --permanent
firewall-cmd --zone=libvirt --add-port=443/tcp
firewall-cmd --zone=libvirt --add-port=443/tcp --permanent
firewall-cmd --list-all
firewall-cmd --list-all-zone
