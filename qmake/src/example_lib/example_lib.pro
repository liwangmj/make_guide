include ($${PWD}/../../toolchain/Rules.pri)

INCLUDEPATH += $${INLCUDELIST}

QT -= gui
TEMPLATE = lib
CONFIG += staticlib

DESTDIR = $${LIBOUTPATH}

TARGET = example_lib_$${OUTSUFFIX}

SOURCES += example_lib.cpp

