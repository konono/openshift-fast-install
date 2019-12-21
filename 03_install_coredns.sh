#!/bin/bash
CURRNTDIR=`pwd`
echo $CURRNTDIR
cd /tmp
useradd coredns
curl -LO https://github.com/coredns/coredns/releases/download/v1.6.3/coredns_1.6.3_linux_amd64.tgz
tar zxvf coredns_1.6.3_linux_amd64.tgz
cp -p ./coredns /usr/bin/
mkdir -p /usr/share/coredns
mkdir -p /etc/coredns/zones
chown -R root.coredns /etc/coredns
chmod -R 755 /etc/coredns
cat << EOF > /etc/systemd/system/coredns.service
[Unit]
Description=CoreDNS DNS server
Documentation=https://coredns.io
After=network.target

[Service]
PermissionsStartOnly=true
LimitNOFILE=1048576
LimitNPROC=512
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_BIND_SERVICE
NoNewPrivileges=true
User=coredns
WorkingDirectory=/usr/share/coredns
ExecStart=/usr/bin/coredns -conf=/etc/coredns/Corefile
ExecReload=/bin/kill -SIGUSR1 $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
cd $CURRNTDIR
cp -a ./etc_conf/coredns /etc/
systemctl start coredns
ip route|grep default |cut -d" " -f3|xargs -I% ip route get %|grep src |cut -d" " -f5|xargs -I% sed -i -e "/^search.*/a nameserver %" /etc/resolv.conf
