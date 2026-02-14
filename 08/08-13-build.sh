#! /bin/bash
here=`pwd`
cd /sources
tar xf m4-1.4.20.tar.xz
cd m4-1.4.20

time {
    ./configure --prefix=/usr
    make
    make check
}

cd $here
