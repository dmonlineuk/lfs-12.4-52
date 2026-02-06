#! /bin/bash
sudo mkfs -v -t ext2 /dev/sda2
sudo mkswap /dev/sda3
sudo mkfs -v -t ext4 /dev/sda4
