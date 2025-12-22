#! /bin/bash
sudo parted /dev/sda --script \
    mklabel gpt \
    mkpart biosboot 1MiB 2MiB \
    set 1 bios_grub on \
    mkpart boot ext4 2MiB 202MiB \
    mkpart swap linux-swap 202MiB 16586MiB \
    mkpart root ext4 16586MiB 100% 
