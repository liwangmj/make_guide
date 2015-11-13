#!/usr/bin/env bash

cd ${PWD}
make CVER=debug clean
make CVER=release clean
make CVER=release

exit 0
