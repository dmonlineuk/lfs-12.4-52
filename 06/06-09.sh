#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf gawk-5.3.2.tar.xz
cd gawk-5.3.2

sed -i 's/extras//' Makefile.in

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/gawk-5.3.2'"
