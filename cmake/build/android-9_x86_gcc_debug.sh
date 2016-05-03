#!/usr/bin/env bash

PROJECT_NAME="cmake"
CPLATFORM="android-9"
CCPU="x86"
CCOMPILE="gcc"
CVER="debug"

cd $(dirname $0)
mkdir -p ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
cd ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
rm -rf *

ANDROID_NDK="${PWD}/../../${PROJECT_NAME}/toolchain/android-ndk-r8/"

${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh --toolchain=x86-4.4.3 --system=linux-x86 --platform=${CPLATFORM} --ndk-dir=${ANDROID_NDK} --install-dir=${PWD}
#${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh --toolchain=x86-4.4.3 --system=darwin-x86_64 --platform=${CPLATFORM} --ndk-dir=${ANDROID_NDK} --install-dir=${PWD}

export PATH=${PWD}/bin/:$PATH
export PATH=${ANDROID_NDK}/build/tools/:$PATH
export ANDROID_STANDALONE_TOOLCHAIN=${PWD}

cmake -DCPLATFORM=${CPLATFORM} -DCCPU=${CCPU} -DCCOMPILE=${CCOMPILE} -DCVER=${CVER} -DBUILD_TESTS=ON -DANDROID_ABI="${CCPU}" -DANDROID_NATIVE_API_LEVEL=${CPLATFORM} -DCMAKE_BUILD_TYPE=${CVER} -DCMAKE_TOOLCHAIN_FILE=${PWD}/../../${PROJECT_NAME}/toolchain/android.toolchain.cmake ${PWD}/../../${PROJECT_NAME}
make -j8
#cmake --build .

exit 0
