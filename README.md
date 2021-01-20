Fix the root password in the template and ks :)

In order to build an EFI based virtual machine, pass the template (qemu-efi.json) into the efi-build.sh script. This will copy a NVRAM file into the current directory for use by the VM, and provide the name in an environment variable that the Packer template is expecting.

The EFI build functionality was tested on Packer 1.6.6 on a RHEL8 host machine. [This shirt](https://www.amazon.com/dp/B07C9FVM4R/) very much applies to this code, it's very janky and POC.
