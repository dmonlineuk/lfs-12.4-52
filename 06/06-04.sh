#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf bash-5.3.tar.gz
cd bash-5.3

time {
    ./configure --prefix=/usr                      \
                --build=$(sh support/config.guess) \
                --host=$LFS_TGT                    \
                --without-bash-malloc

    make && make DESTDIR=$LFS install
}

ln -sv bash $LFS/bin/sh

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/bash-5.3'"
