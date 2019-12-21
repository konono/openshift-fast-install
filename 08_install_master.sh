#!/bin/bash
for i in `seq 0 2`; do
    mac=$((i+2))
    virt-install \
      --name master-$i \
      --hvm \
      --virt-type kvm \
      --pxe \
      --arch x86_64 \
      --os-type linux \
      --os-variant rhel8.0 \
      --network network=ocp,mac="52:54:00:00:01:0${mac}" \
      --vcpus 8 \
      --ram 16384 \
      --disk pool=default,size=100,format=qcow2 \
      --nographics \
      --noautoconsole \
      --boot menu=on,useserial=on 
done
