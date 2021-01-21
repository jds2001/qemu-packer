#!/bin/bash

function die() {
	echo $1
	exit 1
}
dev=$1
[ -z "$dev" ] && die "must specify device!"
end=$(( $(blockdev --getsz $dev) - 1024 ))
dd if=/dev/zero of=$dev bs=512 count=1024
dd if=/dev/zero of=$dev bs=512 count=1024 seek=$end

