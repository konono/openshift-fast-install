#!/bin/bash
mkdir -p /usr/share/nginx/html/ipxe
cp -p ./boot.ipxe /usr/share/nginx/html/ipxe/boot.ipxe
curl -Lo /usr/share/nginx/html/ipxe/rhcos-4.2.0-x86_64-installer-kernel https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.2/4.2.0/rhcos-4.2.0-x86_64-installer-kernel
curl -Lo /usr/share/nginx/html/ipxe/rhcos-4.2.0-x86_64-installer-initramfs.img https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.2/4.2.0/rhcos-4.2.0-x86_64-installer-initramfs.img
curl -Lo /usr/share/nginx/html/ocp/rhcos/images/latest/bios.raw.gz https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.2/4.2.0/rhcos-4.2.0-x86_64-metal-bios.raw.gz
