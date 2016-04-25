#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_android-9_gcc_armeabi-v7a_debug/
cd ${PWD}/../../build/cmake_android-9_gcc_armeabi-v7a_debug/
rm -rf *

../../cmake/toolchain/android-ndk-r8/build/tools/make-standalone-toolchain.sh --platform=android-9 --install-dir=${PWD} --system=linux-x86 --ndk-dir=../../cmake/toolchain/android-ndk-r8/ --toolchain=arm-linux-androideabi-4.4.3

export PATH=${PWD}/bin:$PATH
export ANDROID_STANDALONE_TOOLCHAIN=${PWD}

cmake -DCVER=debug -DCCPU=armeabi-v7a -DCCOMPILE=gcc -DCPLATFORM=android-9 -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain/android.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_NATIVE_API_LEVEL="android-9" ../../cmake
#make -j8
cmake --build .

exit 0
