#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf Python-3.14.2.tar.xz
cd Python-3.14.2

time {
    ./configure --prefix=/usr       \
            --enable-shared     \
            --without-ensurepip \
            --without-static-libpython

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/Python-3.14.2'"
