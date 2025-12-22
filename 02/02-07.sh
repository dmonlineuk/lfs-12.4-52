#! /bin/bash
mkdir -pv $LFS && mount -v -t ext4 /dev/sda4 $LFS
mkdir -v $LFS/boot && mount -v -t ext4 /dev/sda2 $LFS/boot
chown root:root $LFS
chmod 755 $LFS
/sbin/swapon -v /dev/sda3
