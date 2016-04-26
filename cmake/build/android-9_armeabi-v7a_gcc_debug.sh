#!/usr/bin/env bash

mkdir -p ${PWD}/../../build/cmake_android-9_armeabi-v7a_gcc_debug/
cd ${PWD}/../../build/cmake_android-9_armeabi-v7a_gcc_debug/
rm -rf *

ANDROID_NDK=${PWD}/../../cmake/toolchain/android-ndk-r8/

${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh --platform=android-9 --toolchain=arm-linux-androideabi-4.4.3 --system=linux-x86 --ndk-dir=${ANDROID_NDK} --install-dir=${PWD}
#${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh --platform=android-9 --toolchain=arm-linux-androideabi-4.4.3 --system=darwin-x86_64 --ndk-dir=${ANDROID_NDK} --install-dir=${PWD}

export PATH=${PWD}/bin/:$PATH
export PATH=${ANDROID_NDK}/build/tools/:$PATH
export ANDROID_STANDALONE_TOOLCHAIN=${PWD}

cmake -DCPLATFORM=android-9 -DCCPU=armeabi-v7a -DCCOMPILE=gcc -DCVER=debug -DANDROID_NATIVE_API_LEVEL="android-9" -DANDROID_ABI="armeabi-v7a with NEON" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchain/android.toolchain.cmake ../../cmake
#make -j8
cmake --build .

exit 0
