#!/usr/bin/env bash

cd ${PWD}/../

make CVER=debug CCPU=64 CCCOMPILER=g++ PLATFORM=linux clean
make CVER=release CCPU=64 CCCOMPILER=g++ PLATFORM=linux clean
make CVER=debug CCPU=64 CCCOMPILER=g++ PLATFORM=linux 

exit 0
