#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_ios_armeabi-v7a_clang_debug/
cd ${PWD}/../../build/cmake_ios_armeabi-v7a_clang_debug/
rm -rf *

cmake -DCPLATFORM=ios -DCCPU=armeabi-v7a -DCCOMPILE=clang -DCVER=debug -G"Xcode" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CONFIGURATION_TYPES=debug -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain/iOS.cmake ../../cmake 
xcodebuild -configuration "Debug"
#cmake --build .

exit 0
