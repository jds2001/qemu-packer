#!/bin/bash
image=$1
nvram=$2
echo 'the vm will run. Console will be available on port 5928 (VNC). SSH is available on port 2227. End with ctrl-c or poweroff VM'

/usr/libexec/qemu-kvm -vnc 0.0.0.0:28 -machine type=q35,accel=kvm -netdev user,id=user.0,hostfwd=tcp::2227-:22  -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/OVMF_CODE.secboot.fd -drive if=pflash,format=raw,file=$nvram -m 512M -name azure-test -device virtio-net,netdev=user.0 -drive file=${image},if=virtio,cache=writeback,format=raw
