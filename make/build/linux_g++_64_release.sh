#!/usr/bin/env bash

cd ${PWD}/../
make CVER=debug CCPU=64 CPLATFORM=linux CCOMPILER=g++ clean
make CVER=release CCPU=64 CPLATFORM=linux CCOMPILER=g++ clean
make CVER=release CCPU=64 CPLATFORM=linux CCOMPILER=g++

exit 0
