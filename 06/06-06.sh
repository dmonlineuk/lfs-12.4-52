#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf diffutils-3.12.tar.xz
cd diffutils-3.12

time {
    ./configure --prefix=/usr   \
            --host=$LFS_TGT \
            gl_cv_func_strcasecmp_works=y \
            --build=$(./build-aux/config.guess)

    make && make DESTDIR=$LFS install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/diffutils-3.12'"
