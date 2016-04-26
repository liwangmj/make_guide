#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_macx_x86-64_llvm_release/
cd ${PWD}/../../build/cmake_macx_x86-64_llvm_release/
rm -rf *

cmake -DCPLATFORM=macx -DCCPU=x86-64 -DCCOMPILE=llvm -DCVER=release -G"Xcode" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CONFIGURATION_TYPES=release ../../cmake 
xcodebuild -configuration Release
#cmake --build .

exit 0
