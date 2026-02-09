#! /bin/bash
here=`pwd`
cd /sources
tar xf Python-3.13.7.tar.xz
cd Python-3.13.7

time {
    ./configure --prefix=/usr       \
            --enable-shared     \
            --without-ensurepip \
            --without-static-libpython

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/Python-3.13.7'"
