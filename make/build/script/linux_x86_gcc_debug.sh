#!/usr/bin/env bash

cd $(dirname $0)
cd ${PWD}/../../

make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=debug clean
make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=release clean
make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=debug

exit 0
