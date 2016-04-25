#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_g++_64_debug/
cd ${PWD}/../../build/cmake_linux_g++_64_debug/
rm -rf *

cmake -DCVER=debug -DCCPU=64 -DCCOMPILE=g++ -DCPLATFORM=linux -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ../../cmake
#make -j8
cmake --build .

exit 0
