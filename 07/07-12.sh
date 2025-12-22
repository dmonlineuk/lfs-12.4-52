#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf util-linux-2.41.2.tar.xz
cd util-linux-2.41.2

mkdir -pv /var/lib/hwclock

time {
    ./configure --libdir=/usr/lib     \
            --runstatedir=/run    \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-static      \
            --disable-liblastlog2 \
            --without-python      \
            ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --docdir=/usr/share/doc/util-linux-2.41.2

    make && make install
}

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/util-linux-2.41.2'"
