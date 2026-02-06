#! /bin/bash
here=`pwd`
cd $LFS/sources/glibc-2.42/build

echo 'int main(){}' | $LFS_TGT-gcc -x c - -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

echo "Expected: [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]"

grep -E -o "$LFS/lib.*/S?crt[1in].*succeeded" dummy.log

echo "Expected:"
echo "   /mnt/lfs/lib/../lib/Scrt1.o succeeded"
echo "   /mnt/lfs/lib/../lib/crti.o succeeded"
echo "   /mnt/lfs/lib/../lib/crtn.o succeeded"

grep -B3 "^ $LFS/usr/include" dummy.log

echo "Expected:"
echo "   #include <...> search starts here:"
echo "    /mnt/lfs/tools/lib/gcc/x86_64-lfs-linux-gnu/15.2.0/include"
echo "    /mnt/lfs/tools/lib/gcc/x86_64-lfs-linux-gnu/15.2.0/include-fixed"
echo "    /mnt/lfs/usr/include"

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'

echo "Expected:"
echo '    SEARCH_DIR("=/mnt/lfs/tools/x86_64-lfs-linux-gnu/lib64")'
echo '    SEARCH_DIR("=/usr/local/lib64")'
echo '    SEARCH_DIR("=/lib64")'
echo '    SEARCH_DIR("=/usr/lib64")'
echo '    SEARCH_DIR("=/mnt/lfs/tools/x86_64-lfs-linux-gnu/lib")'
echo '    SEARCH_DIR("=/usr/local/lib")'
echo '    SEARCH_DIR("=/lib")'
echo '    SEARCH_DIR("=/usr/lib");'

grep "/lib.*/libc.so.6 " dummy.log

echo "Expected: attempt to open /mnt/lfs/usr/lib/libc.so.6 succeeded"

grep found dummy.log

echo "Expected: found ld-linux-x86-64.so.2 at /mnt/lfs/usr/lib/ld-linux-x86-64.so.2"

cd $here

echo "Delete when ready: 'rm -v a.out dummy.log'"
echo "If complete, delete 'rm -rf $LFS/sources/glibc-2.42'"
