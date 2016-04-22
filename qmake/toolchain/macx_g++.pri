QMAKE_CFLAGS += -fPIC -fshort-wchar
QMAKE_CXXFLAGS += -fPIC -fshort-wchar
QMAKE_CFLAGS_RELEASE += -O2 -Wall -rdynamic -ldl
QMAKE_CXXFLAGS_RELEASE += -O2 -Wall -rdynamic -ldl
QMAKE_LFLAGS_RELEASE += -Wl,-rpath=./:./lib:./plugin
QMAKE_CFLAGS_DEBUG += -g
QMAKE_CXXFLAGS_DEBUG += -g
QMAKE_LFLAGS_DEBUG += -Wl,-rpath=$${APPOUTPATH}:$${LIBOUTPATH}:$${DLLOUTPATH}

LIBSUFFIX = .a
DLLSUFFIX = .dylib

CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}_d
    DEFINES += __DEBUG

    contains(CVER, 64) {
        DEFINES += __MACX_GXX_64
        
        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __MACX_GXX_32

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}

    contains(CVER, 64) {
        DEFINES += __MACX_GXX_64

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __MACX_GXX_32

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }
}
