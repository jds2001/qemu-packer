#!/bin/bash

ip=$1
mkdir /stage
mount -t tmpfs -o size=5500M tmpfs /stage
cd /stage
wget http://${ip}/~jstanley/efi-image/efi-test
dd if=efi-test of=/dev/sda
sgdisk -e /dev/sda
partprobe
parted /dev/sda resize 3 100%
partprobe
pvscan
pvresize /dev/sda3
mkdir /sysimage
mount /dev/vg0/root /sysimage
xfs_growfs /dev/vg0/root
rm /sysimage/etc/ssh/*key*
umount /sysimage

