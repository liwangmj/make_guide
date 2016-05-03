#!/usr/bin/env bash

PROJECT_NAME="cmake"
CPLATFORM="linux"
CCPU="x86-64"
CCOMPILE="gcc"
CVER="debug"

cd $(dirname $0)
mkdir -p ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
cd ${PWD}/../../build/${PROJECT_NAME}_${CPLATFORM}_${CCPU}_${CCOMPILE}_${CVER}/
rm -rf *

cmake -DCPLATFORM=${CPLATFORM} -DCCPU=${CCPU} -DCCOMPILE=${CCOMPILE} -DCVER=${CVER} -DBUILD_TESTS=ON -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=${CVER} ${PWD}/../../${PROJECT_NAME}
make -j8

exit 0
