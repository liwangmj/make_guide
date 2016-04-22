#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_g++_64_debug/
cd ${PWD}/../../build/cmake_linux_g++_64_debug/
rm -rf *

cmake -DCVER=debug -DCCPU=64 -DCCOMPILE=g++ -DCPLATFORM=linux ../../cmake
make

exit 0

