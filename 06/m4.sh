#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf m4-1.4.20.tar.xz
cd m4-1.4.20

time {
    ./configure --prefix=/usr   \
                --host=$LFS_TGT \
                --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/m4-1.4.20'"
