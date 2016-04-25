#!/usr/bin/env bash

cd ${PWD}/../

make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=debug clean
make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=release clean
make PLATFORM=linux CCPU=x86 CCCOMPILER=gcc CVER=release

exit 0
