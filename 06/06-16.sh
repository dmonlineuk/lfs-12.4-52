#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf xz-5.8.1.tar.xz
cd xz-5.8.1

time {
    ./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.8.1

    make && make DESTDIR=$LFS install
}

rm -v $LFS/usr/lib/liblzma.la

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/xz-5.8.1'"
