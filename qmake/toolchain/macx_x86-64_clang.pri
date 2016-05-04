QMAKE_LFLAGS_SONAME = -Wl,-install_name,@rpath/

QMAKE_CFLAGS += -fPIC
QMAKE_CXXFLAGS += -fPIC
QMAKE_LFLAGS += -Wl,-rpath,@loader_path,-rpath,@executable_path,-rpath,@executable_path/../../../
QMAKE_CFLAGS_DEBUG += -g
QMAKE_CXXFLAGS_DEBUG += -g
QMAKE_CFLAGS_RELEASE += -O2 -Wall
QMAKE_CXXFLAGS_RELEASE += -O2 -Wall

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
