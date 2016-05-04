#!/usr/bin/env bash

PROJECT_NAME="cmake"
CPLATFORM="ios"
CCPU="x86-64"
CCOMPILE="clang"
CVER="debug"

cd $(dirname $0)
mkdir -p ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
cd ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
rm -rf *

cmake -DCPLATFORM=${CPLATFORM} -DCCPU=${CCPU} -DCCOMPILE=${CCOMPILE} -DCVER=${CVER} -DBUILD_TESTS=ON -G"Xcode" -DCMAKE_BUILD_TYPE=${CVER} -DCMAKE_CONFIGURATION_TYPES=${CVER} -DCMAKE_TOOLCHAIN_FILE=${PWD}/../../${PROJECT_NAME}/toolchain/iOS.cmake ${PWD}/../../${PROJECT_NAME} 
xcodebuild -project ${PROJECT_NAME}.xcodeproj -configuration ${CVER}
#cmake --build .

exit 0
