include ($${PWD}/../../qmake/Rules.pri)

include ($${PWD}/module_a/module_a.pro)
include ($${PWD}/module_b/module_b.pro)

LIBS += $${LIBSLIST}

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
TEMPLATE = app

DESTDIR = $${APPOUTPATH}

TARGET = example_app

SOURCES += main.cpp \
           mainwindow.cpp

HEADERS += mainwindow.h

FORMS += mainwindow.ui

