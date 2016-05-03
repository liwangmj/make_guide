#QMAKE_CFLAGS_DEBUG += -Zi -MDd
#QMAKE_CXXFLAGS_DEBUG += -Zi -MDd
QMAKE_LFLAGS_DEBUG += /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:libcmtd.lib /NODEFAULTLIB:msvcprtd.lib
#QMAKE_CFLAGS_RELEASE += -O2 -MD
#QMAKE_CXXFLAGS_RELEASE += -O2 -MD
QMAKE_LFLAGS_RELEASE += /NODEFAULTLIB:libcmt.lib


LIBSUFFIX = .lib
DLLSUFFIX = .dll

DEFINES += __WIN32

CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCPU}_$${CCOMPILE}_d
    DEFINES += __DEBUG

    LIBSLIST += $${LIBOUTPATH}/example_lib_$${OUTSUFFIX}$${LIBSUFFIX}
    LIBSLIST += -L$${DLLOUTPATH} \
                -lexample_dll_$${OUTSUFFIX}

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCPU}_$${CCOMPILE}

    LIBSLIST += $${LIBOUTPATH}/example_lib_$${OUTSUFFIX}$${LIBSUFFIX}
    LIBSLIST += -L$${DLLOUTPATH} \
                -lexample_dll_$${OUTSUFFIX}
}
