#!/bin/bash
image=$1
echo 'the vm will run. Console will be available on port 5928 (VNC). SSH is available on port 2227. End with ctrl-c or poweroff VM'

/usr/libexec/qemu-kvm -vnc 0.0.0.0:28 -machine type=pc,accel=kvm -netdev user,id=user.0,hostfwd=tcp::2227-:22   -m 512M -name azure-test -device virtio-net,netdev=user.0 -drive file=${image},if=virtio,cache=writeback,format=raw
