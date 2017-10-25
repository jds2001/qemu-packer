#!/bin/bash

cat > /etc/sysconfig/network <<EOF
ETWORKING=yes
HOSTNAME=localhost.localdomain
EOF
cat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF
DEVICE=eth0
ONBOOT=yes
BOOTPROTO=dhcp
TYPE=Ethernet
USERCTL=no
PEERDNS=yes
IPV6INIT=no
NM_CONTROLLED=no
EOF
ln -s /dev/null /etc/udev/rules.d/75-persistent-net-generator.rules

systemctl enable waagent.service
echo 'enabled service'
