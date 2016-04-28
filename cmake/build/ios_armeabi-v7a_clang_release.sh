#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_ios_armeabi-v7a_clang_release/
cd ${PWD}/../../build/cmake_ios_armeabi-v7a_clang_release/
rm -rf *

cmake -DCPLATFORM=ios -DCCPU=armeabi-v7a -DCCOMPILE=clang -DCVER=release -G"Xcode" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CONFIGURATION_TYPES=release -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain/iOS.cmake ../../cmake 
xcodebuild -configuration "Release"
#cmake --build .

exit 0
