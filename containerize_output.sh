#!/usr/bin/bash

function die() {
	echo $1
	exit 1
}
[ -z "$image" ] && die "image environment variable must be set"
[ -z "$ctr_name" ] && die "ctr_name environment variable must be set"
container=$(buildah from scratch)
dir=$(buildah mount $container)
cp $image $dir
buildah commit $container $ctr_name
buildah unmount $container
