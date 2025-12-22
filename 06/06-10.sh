#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf grep-3.12.tar.xz
cd grep-3.12

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/grep-3.12'"
