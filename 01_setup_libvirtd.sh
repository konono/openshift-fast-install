#!/bin/bash
yum -y install libvirtd virt-install
virsh net-define ./ocp.xml
virsh net-start ocp
