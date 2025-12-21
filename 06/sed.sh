#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf sed-4.9.tar.xz
cd sed-4.9

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/sed-4.9'"
