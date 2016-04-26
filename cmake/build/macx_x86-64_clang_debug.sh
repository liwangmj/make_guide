#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_macx_x86-64_clang_debug/
cd ${PWD}/../../build/cmake_macx_x86-64_clang_debug/
rm -rf *

cmake -DCPLATFORM=macx -DCCPU=x86-64 -DCCOMPILE=clang -DCVER=debug -G"Xcode" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CONFIGURATION_TYPES=debug ../../cmake 
xcodebuild -configuration Debug
#cmake --build .

exit 0
