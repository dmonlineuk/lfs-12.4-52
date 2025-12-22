#! /bin/bash
here=`pwd`
cd $LFS/sources
tar xf gettext-0.26.tar.xz
cd gettext-0.26

time {
    ./configure --disable-shared

    make
}

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

cd $here

echo "If complete, delete 'rm -rf $LFS/sources/gettext-0.26'"
