#!/bin/bash
for i in `seq 0 1`; do
    mac=$((i+5))
    virt-install \
      --name worker-$i \
      --hvm \
      --virt-type kvm \
      --pxe \
      --arch x86_64 \
      --os-type linux \
      --os-variant rhel8.0 \
      --network network=ocp,mac="52:54:00:00:01:0${mac}" \
      --vcpus 4 \
      --ram 16384 \
      --disk pool=default,size=100,format=qcow2 \
      --nographics \
      --noautoconsole \
      --boot menu=on,useserial=on
done
