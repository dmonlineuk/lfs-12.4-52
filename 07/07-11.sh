#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf texinfo-7.2.tar.xz
cd texinfo-7.2

time {
    ./configure --prefix=/usr

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/texinfo-7.2'"
