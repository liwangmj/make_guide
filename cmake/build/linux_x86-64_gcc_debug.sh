#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_x86-64_gcc_debug/
cd ${PWD}/../../build/cmake_linux_x86-64_gcc_debug/
rm -rf *

cmake -DCPLATFORM=linux -DCCPU=x86-64 -DCCOMPILE=gcc -DCVER=debug -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../../cmake
make -j8

exit 0
