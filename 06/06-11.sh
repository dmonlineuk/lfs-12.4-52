#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf gzip-1.14.tar.xz
cd gzip-1.14

time {
    ./configure --prefix=/usr --host=$LFS_TGT

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/gzip-1.14'"
