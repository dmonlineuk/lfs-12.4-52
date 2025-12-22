#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf binutils-2.45.1.tar.xz
cd binutils-2.45.1

mkdir -v build && cd build

time {
    ../configure --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-new-dtags  \
             --enable-default-hash-style=gnu

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/binutils-2.45.1'"
