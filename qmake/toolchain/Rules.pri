PROJECTPATH = E:/SourceCode/eclipse/make_guide/qmake/

CONFIG(debug, debug|release) {
    CVER = debug
} else {
    CVER = release
}

contains(QMAKE_TARGET.arch, x86_64) {
    CCPU = x86-64
} else {
    contains(QMAKE_TARGET.arch, x86) {
        CCPU = x86
    } else {
        CCPU = x86
    }
}

win32-msvc2010 {
    CPLATFORM = win32
    CCOMPILE = msvc2010
}
win32-g++ {
    CPLATFORM = win32
    CCOMPILE = gcc
}
macx-g++ {
    CPLATFORM = macx
    CCOMPILE = gcc
}
macx-clang {
    CPLATFORM = macx
    CCOMPILE = clang
}
linux-g++ {
    CPLATFORM = linux
    CCOMPILE = gcc
}
android-g++ {
    CPLATFORM = android
    CCOMPILE = gcc
    CCPU = armeabi-v7a
}
macx-ios-clang {
    CPLATFORM = ios
    CCOMPILE = clang
    CCPU = armeabi-v7a
}

APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
include ($${PROJECTPATH}/toolchain/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}.pri)

INLCUDELIST += $${PROJECTPATH}/include/example_lib/ \
               $${PROJECTPATH}/include/example_dll/
