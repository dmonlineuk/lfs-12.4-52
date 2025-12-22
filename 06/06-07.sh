#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf file-5.46.tar.gz
cd file-5.46

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

time {
    ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

    make FILE_COMPILE=$(pwd)/build/src/file
    make DESTDIR=$LFS install
}

rm -v $LFS/usr/lib/libmagic.la

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/file-5.46'"
