#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf make-4.4.1.tar.gz
cd make-4.4.1

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/make-4.4.1'"
