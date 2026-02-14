#! /bin/bash
here=`pwd`
cd /sources/m4-1.4.20

time {
    make install
}

cd $here

echo "If complete, delete 'rm -rf /sources/m4-1.4.20'"
