#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf patch-2.8.tar.xz
cd patch-2.8

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/patch-2.8'"
