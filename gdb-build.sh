#!/bin/sh
set -ex

for V in 7.7 7.11.1; do
for P in 2.7 3; do
    PREFIX="$PWD/gdb-$V-python-$P"
    URL="https://ftp.gnu.org/gnu/gdb/gdb-$V.tar.gz"
    rm -rf gdb-$/
    wget -nc $URL
    tar xf gdb-$V.tar.gz
    pushd  gdb-$V

    ./configure  --with-python="/usr/bin/python$P" --prefix="$PREFIX" --enable-target=all
    make all -j$(nproc)
    make install -j$(nproc)

    popd
done
done
