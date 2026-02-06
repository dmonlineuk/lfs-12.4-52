#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf linux-6.16.1.tar.xz
cd linux-6.16.1

make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/linux-6.16.1'"
