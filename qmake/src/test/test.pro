include ($${PWD}/../../toolchain/Rules.pri)

INCLUDEPATH += $${INLCUDELIST}
LIBS += $${LIBSLIST}

QT -= gui
TEMPLATE = app

DESTDIR = $${APPOUTPATH}

TARGET = runtest

SOURCES += main.cpp

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
