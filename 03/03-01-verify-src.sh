#! /bin/bash
cp md5sums.txt $LFS/sources/

pushd $LFS/sources
  md5sum -c md5sums.txt
popd
