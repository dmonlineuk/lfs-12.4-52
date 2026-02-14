#! /bin/bash
here=`pwd`
cd /sources
tar xf glibc-2.42.tar.xz
cd glibc-2.42

patch -Np1 -i ../glibc-2.42-fhs-1.patch

sed -e '/unistd.h/i #include <string.h>' \
    -e '/libc_rwlock_init/c\
  __libc_rwlock_define_initialized (, reset_lock);\
  memcpy (&lock, &reset_lock, sizeof (lock));' \
    -i stdlib/abort.c 

mkdir -v build && cd build

echo "rootsbindir=/usr/sbin" > configparms

time {
    ../configure --prefix=/usr                   \
             --disable-werror                \
             --disable-nscd                  \
             libc_cv_slibdir=/usr/lib        \
             --enable-stack-protector=strong \
             --enable-kernel=5.4

    make
}

cd $here
