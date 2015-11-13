#!/usr/bin/env bash

cd ${PWD}
make CVER=debug clean
make CVER=release clean
make CVER=debug

exit 0
