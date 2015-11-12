include ($${PWD}/toolchain/Rules.pri)

TEMPLATE = subdirs
CONFIG += ordered

SUBDIRS = src/example_lib \
          src/example_dll \
          src/example_app \
          testing
