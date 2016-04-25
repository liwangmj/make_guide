#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_x86-64_gcc_release/
cd ${PWD}/../../build/cmake_linux_x86-64_gcc_release/
rm -rf *

cmake -DCPLATFORM=linux -DCCPU=x86-64 -DCCOMPILE=gcc -DCVER=release -DCMAKE_BUILD_TYPE=Release ../../cmake 
make -j8

exit 0
