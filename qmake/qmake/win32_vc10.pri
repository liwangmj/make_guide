QMAKE_CFLAGS_RELEASE = -O2 -MD
QMAKE_CXXFLAGS_RELEASE = -O2 -MD
#QMAKE_LFLAGS_RELEASE += /NODEFAULTLIB:libc.lib /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:msvcrt.lib
QMAKE_CFLAGS_DEBUG = -Zi -MDd
QMAKE_CXXFLAGS_DEBUG = -Zi -MDd
#QMAKE_LFLAGS_DEBUG += /NODEFAULTLIB:libcmtd.lib /NODEFAULTLIB:msvcrtd.lib

CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}_d
    DEFINES += __DEBUG

    contains(CVER, 64) {
        DEFINES += __WIN32_VC10_64
        
        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_VC10_32

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}

    contains(CVER, 64) {
        DEFINES += __WIN32_VC10_64

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_VC10_32

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }
}
