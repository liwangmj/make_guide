PROJECTPATH = E:/SourceCode/eclipse/make_guide/qmake/

CONFIG(debug, debug|release) {
    CVER = debug
} else {
    CVER = release
}

win32-msvc2010 {
    CPLATFORM = win32
    CCPU = x86
    CCOMPILE = msvc2010
}
win32-g++ {
    CPLATFORM = win32
    CCPU = x86
    CCOMPILE = gcc
}
macx-g++ {
    CPLATFORM = macx
    CCPU = x86-64
    CCOMPILE = gcc
}
macx-clang {
    CPLATFORM = macx
    CCPU = x86-64
    CCOMPILE = clang
}
linux-g++ {
    CPLATFORM = linux
    CCPU = x86
    CCOMPILE = gcc
}
android-g++ {
    CPLATFORM = android
    CCPU = armeabi-v7a
    CCOMPILE = gcc
}
macx-ios-clang {
    CPLATFORM = ios
    CCPU = armeabi-v7a
    CCOMPILE = clang
}

APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}/$${CVER}/
include ($${PROJECTPATH}/toolchain/$${CPLATFORM}_$${CCPU}_$${CCOMPILE}.pri)

INLCUDELIST += $${PROJECTPATH}/include/example_lib/ \
               $${PROJECTPATH}/include/example_dll/
