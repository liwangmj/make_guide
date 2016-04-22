#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_linux_g++_64_release/
cd ${PWD}/../../build/cmake_linux_g++_64_release/
rm -rf *

cmake -D CVER=release -D CCPU=64 -D CCOMPILE=g++ -D CPLATFORM=linux ../../cmake 
make

exit 0

