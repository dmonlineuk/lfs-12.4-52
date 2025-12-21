#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf binutils-2.45.1.tar.xz
cd binutils-2.45.1

sed '6031s/$add_dir//' -i ltmain.sh

mkdir -v build && cd build

time {
    ../configure                   \
        --prefix=/usr              \
        --build=$(../config.guess) \
        --host=$LFS_TGT            \
        --disable-nls              \
        --enable-shared            \
        --enable-gprofng=no        \
        --disable-werror           \
        --enable-64-bit-bfd        \
        --enable-new-dtags         \
        --enable-default-hash-style=gnu

    make && make DESTDIR=$LFS install
}

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/binutils-2.45.1'"
