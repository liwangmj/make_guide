include ($${PWD}/../../toolchain/Rules.pri)

INCLUDEPATH += $${INLCUDELIST}

QT -= gui
TEMPLATE = lib
DEFINES += QT_DLL_LIBRARY

VERSION = 1.2.1

DESTDIR = $${DLLOUTPATH}

TARGET = example_dll_$${OUTSUFFIX}

SOURCES += example_dll.cpp

