include ($${PWD}/../../qmake/Rules.pri)

QT -= gui
TEMPLATE = lib
DEFINES += QT_DLL_LIBRARY

DESTDIR = $${DLLOUTPATH}

TARGET = example_dll_$${OUTSUFFIX}

SOURCES += example_dll.cpp

