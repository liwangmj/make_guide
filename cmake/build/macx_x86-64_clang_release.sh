#!/usr/bin/env bash

PROJECT_NAME="cmake"
CPLATFORM="macx"
CCPU="x86-64"
CCOMPILE="clang"
CVER="release"

cd $(dirname $0)
mkdir -p ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
cd ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
rm -rf *

cmake -DCPLATFORM=${CPLATFORM} -DCCPU=${CCPU} -DCCOMPILE=${CCOMPILE} -DCVER=${CVER} -G"Xcode" -DCMAKE_BUILD_TYPE=${CVER} -DCMAKE_CONFIGURATION_TYPES=${CVER} ${PWD}/../../${PROJECT_NAME} 
xcodebuild -project ${PROJECT_NAME}.xcodeproj -configuration ${CVER}
#cmake --build .

exit 0
