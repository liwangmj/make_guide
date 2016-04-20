include ($${PWD}/../../toolchain/Rules.pri)

INCLUDEPATH += $${INLCUDELIST}
#QMAKE_LFLAGS += -Wl,--whole-archive $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX} -Wl,--no-whole-archive

QT -= gui
TEMPLATE = lib
DEFINES += QT_DLL_LIBRARY

DESTDIR = $${DLLOUTPATH}

TARGET = example_dll_$${OUTSUFFIX}

SOURCES += example_dll.cpp

