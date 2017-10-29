MB=$((1024*1024))
size=$(qemu-img info -f raw --output json $1 | gawk 'match($0, /"virtual-size": ([0-9]+),/, val) {print val[1]}')
rounded_size=$((($size/$MB + 1)*$MB))
qemu-img resize $1 $rounded_size
qemu-img convert -f raw -o subformat=fixed -O vpc $1 ${1}.vhd
