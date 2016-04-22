#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_g++_64_debug/
cd ${PWD}/../../build/cmake_linux_g++_64_debug/
rm -rf *

cmake -D CVER=debug -D CCPU=64 -D CCOMPILE=g++ -D CPLATFORM=linux ../../cmake
make

exit 0

