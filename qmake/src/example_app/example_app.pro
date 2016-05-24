include ($${PWD}/../../toolchain/Rules.pri)

include ($${PWD}/module_a/module_a.pro)
include ($${PWD}/module_b/module_b.pro)

INCLUDEPATH += $${INLCUDELIST}
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

contains(CPLATFORM, android) {
    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}
