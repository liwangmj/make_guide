PROJECTPATH = e:/Wim/Desktop/qmake

CONFIG(debug, debug|release) {
    CVER = debug
} else {
    CVER = release
}

contains(QMAKE_TARGET.arch, x86_64) {
    CCPU = 64
} else {
    contains(QMAKE_TARGET.arch, x86) {
        CCPU = 32
    } else {
        CCPU = 32
    }
}

win32-msvc2010 | win32-msvc2012 {
    CPLATFORM = win32
    CCOMPILE = msvc
}
win32-g++ {
    CPLATFORM = win32
    CCOMPILE = g++
}
macx-g++ {
    CPLATFORM = macx
    CCOMPILE = g++
}
macx-llvm {
    CPLATFORM = macx
    CCOMPILE = llvm
}
linux-g++ {
    CPLATFORM = linux
    CCOMPILE = g++
}

APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
include ($${PROJECTPATH}/toolchain/$${CPLATFORM}_$${CCOMPILE}.pri)

INLCUDELIST += $${PROJECTPATH}/include/example_lib \
               $${PROJECTPATH}/include/example_dll
