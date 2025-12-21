#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf ncurses-6.5-20250809.tar.xz
cd ncurses-6.5-20250809

mkdir build
pushd build
  ../configure --prefix=$LFS/tools AWK=gawk
  make -C include
  make -C progs tic
  install progs/tic $LFS/tools/bin
popd



time {
    ./configure --prefix=/usr                \
                --host=$LFS_TGT              \
                --build=$(./config.guess)    \
                --mandir=/usr/share/man      \
                --with-manpage-format=normal \
                --with-shared                \
                --without-normal             \
                --with-cxx-shared            \
                --without-debug              \
                --without-ada                \
                --disable-stripping          \
                AWK=gawk

    make && make DESTDIR=$LFS install
    
    ln -sv libncursesw.so $LFS/usr/lib/libncurses.so
    sed -e 's/^#if.*XOPEN.*$/#if 1/' \
        -i $LFS/usr/include/curses.h
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/ncurses-6.5-20250809'"
