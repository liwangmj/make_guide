PROJECTPATH = E:/SourceCode/qmake

INCLUDEPATH += $${PROJECTPATH}/include/example_lib \
               $${PROJECTPATH}/include/example_dll

CONFIG(debug, debug|release) {
    CVER = debug
} else {
    CVER = release
}

contains(QMAKE_TARGET.arch, x86_64) {
    CCPU = 64
} else {
    CCPU = 32
}

win32-msvc2010 {
    CPLATFORM = win32
    CCOMPILE = vc10
    APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    include ($${PROJECTPATH}/qmake/$${CPLATFORM}_$${CCOMPILE}.pri)
}

win32-g++ {
    CPLATFORM = win32
    CCOMPILE = g++
    APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    include ($${PROJECTPATH}/qmake/$${CPLATFORM}_$${CCOMPILE}.pri)
}

linux-g++ {
    CPLATFORM = linux
    CCOMPILE = g++
    APPOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    DLLOUTPATH = $${PROJECTPATH}/bin/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    LIBOUTPATH = $${PROJECTPATH}/lib/$${CPLATFORM}_$${CCOMPILE}_$${CCPU}/$${CVER}
    include ($${PROJECTPATH}/qmake/$${CPLATFORM}_$${CCOMPILE}.pri)
}

macx {
# mac only
}
