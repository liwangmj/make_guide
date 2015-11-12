export PROJECTNAME=$(shell pwd |sed 's/^\(.*\)[/]//')
export PROJECTPATH=${PWD}
export MAKEINCLUDE=${PROJECTPATH}/toolchain/Rules.mak

SUBDIRS = src/example_lib \
          src/example_dll \
          src/example_app

include ${MAKEINCLUDE}

