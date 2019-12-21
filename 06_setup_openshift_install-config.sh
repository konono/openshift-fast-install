#!/bin/bash
rm -rf ./bare-metal
mkdir -p ./bare-metal
cat << EOF > /root/install-config.yaml
apiVersion: v1
baseDomain: lab.local
compute:
- hyperthreading: Enabled
  name: worker
  replicas: 0
controlPlane:
  hyperthreading: Enabled
  name: master
  replicas: 3
metadata:
  name: test
networking:
  clusterNetworks:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  networkType: OpenShiftSDN
  serviceNetwork:
  - 172.30.0.0/16
platform:
  none: {}
pullSecret: ''
sshKey: ''
EOF

cp -p /root/install-config.yaml /root/openshift-fast-install/bare-metal/
curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-install-linux-4.2.10.tar.gz
tar zxvf openshift-install-linux-4.2.10.tar.gz
./openshift-install create ignition-configs --dir=bare-metal
rm -rf /usr/share/nginx/html/ocp/rhcos/ignitions/*
cp -p ./bare-metal/*.ign /usr/share/nginx/html/ocp/rhcos/ignitions/
