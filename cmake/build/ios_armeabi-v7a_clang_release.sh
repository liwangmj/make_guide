#!/usr/bin/env bash

PROJECT_NAME="cmake"

CPLATFORM="ios"
CCPU="armeabi-v7a"
CCOMPILE="clang"
CVER="release"

mkdir -p ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
cd ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
rm -rf *

cmake -DCPLATFORM=${CPLATFORM} -DCCPU=${CCPU} -DCCOMPILE=${CCOMPILE} -DCVER=${CVER} -G"Xcode" -DCMAKE_BUILD_TYPE=${CVER} -DCMAKE_CONFIGURATION_TYPES=${CVER} -DCMAKE_TOOLCHAIN_FILE=../../${PROJECT_NAME}/toolchain/iOS.cmake ../../${PROJECT_NAME} 
xcodebuild -configuration ${CVER}
#cmake --build .

exit 0
