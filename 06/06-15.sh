#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf tar-1.35.tar.xz
cd tar-1.35

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/tar-1.35'"
