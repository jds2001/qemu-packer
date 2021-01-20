BUILD=$(echo $RANDOM | md5sum | awk '{print $1}')
export BUILD
cp /usr/share/OVMF/OVMF_VARS.secboot.fd ./OVMF.${BUILD}.vars
NVRAM=$(pwd)/OVMF.${BUILD}.vars
export NVRAM
echo $NVRAM
PACKER_LOG=1 packer build $@
