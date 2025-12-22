#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf bison-3.8.2.tar.xz
cd bison-3.8.2

time {
    ./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/bison-3.8.2'"
