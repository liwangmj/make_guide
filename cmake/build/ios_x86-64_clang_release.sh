#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_ios_x86-64_clang_release/
cd ${PWD}/../../build/cmake_ios_x86-64_clang_release/
rm -rf *

cmake -DCPLATFORM=ios -DCCPU=x86-64 -DCCOMPILE=clang -DCVER=release -G"Xcode" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CONFIGURATION_TYPES=release -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain/iOS.cmake -DIOS_PLATFORM=SIMULATOR64 ../../cmake 
xcodebuild -configuration "Release"
#cmake --build .

exit 0
