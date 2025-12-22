#! /bin/bash
cp md5sums-patch.txt $LFS/sources/

pushd $LFS/sources
  md5sum -c md5sums-patch.txt
popd
