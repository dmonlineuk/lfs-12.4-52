#! /bin/bash
here=`pwd`
cd /sources
tar xf zlib-1.3.1.tar.xz
cd zlib-1.3.1

time {
    ../configure --prefix=/usr                   

    make && make install
}

rm -fv /usr/lib/libz.a

cd $here

echo "If complete, delete 'rm -rf /sources/zlib-1.3.1'"
