#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_g++_64_release/
cd ${PWD}/../../build/cmake_linux_g++_64_release/
rm -rf *

cmake -DCVER=release -DCCPU=64 -DCCOMPILE=g++ -DCPLATFORM=linux ../../cmake 
make; make test; make install

exit 0

