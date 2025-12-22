#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf findutils-4.10.0.tar.xz
cd findutils-4.10.0

time {
    ./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/findutils-4.10.0'"
