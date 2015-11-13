#!/usr/bin/env bash

cd ${PWD}
make CVER=debug CCPU=64 clean
make CVER=release CCPU=64 clean
make CVER=debug

exit 0
