include ($${PWD}/../toolchain/Rules.pri)

INCLUDEPATH += $${INLCUDELIST}
LIBS += $${LIBSLIST}

QT -= gui
TEMPLATE = app

DESTDIR = $${APPOUTPATH}

TARGET = runtest

SOURCES += main.cpp

