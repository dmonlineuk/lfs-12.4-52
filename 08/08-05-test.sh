#! /bin/bash
here=`pwd`
cd /sources/glibc-2.42/build/

make check

cd $here
