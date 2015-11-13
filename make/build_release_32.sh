#!/usr/bin/env bash

cd ${PWD}
make CVER=debug CCPU=32 clean
make CVER=release CCPU=32 clean
make CVER=release

exit 0
