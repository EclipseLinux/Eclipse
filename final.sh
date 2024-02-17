#!/bin/zsh

BR_DIR="$(pwd)"

OUT_DIR="$(pwd)/output/images/eclipse"
mkdir $OUT_DIR
cd $OUT_DIR

mkdir boot
mkdir boot/grub

cp ../bzImage boot/vmlinuz
cp ../rootfs.cpio boot/initrd
cp $BR_DIR/grub.cfg boot/grub/grub.cfg

grub-mkrescue -o ../Eclipse-$(date +%Y.%m.%d)-x86_64.iso . -d /usr/lib/grub/x86_64-efi

echo "\u001b[32mSucessfully created Eclipse Bootable Image\u001b[0m"
