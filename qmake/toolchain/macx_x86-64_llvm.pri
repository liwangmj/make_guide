QMAKE_CFLAGS += -m64 -fPIC
QMAKE_CXXFLAGS += -m64 -fPIC
QMAKE_CFLAGS_RELEASE += -O2 -Wall -rdynamic -ldl
QMAKE_CXXFLAGS_RELEASE += -O2 -Wall -rdynamic -ldl
QMAKE_LFLAGS_RELEASE += -Wl,-rpath=./:./lib/:./plugin/
QMAKE_CFLAGS_DEBUG += -g
QMAKE_CXXFLAGS_DEBUG += -g
QMAKE_LFLAGS_DEBUG += -Wl,-rpath=$${APPOUTPATH}:$${LIBOUTPATH}:$${DLLOUTPATH}

LIBSUFFIX = .a
DLLSUFFIX = .dylib

DEFINES += __MACX

CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCPU}_$${CCOMPILE}_d
    DEFINES += __DEBUG

    LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
    LIBSLIST += -L$${DLLOUTPATH} \
                -lexample_dll_$${OUTSUFFIX}

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCPU}_$${CCOMPILE}

    LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
    LIBSLIST += -L$${DLLOUTPATH} \
                -lexample_dll_$${OUTSUFFIX}
}
