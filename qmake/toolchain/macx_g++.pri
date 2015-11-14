CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}_d
    DEFINES += __DEBUG
    QMAKE_LFLAGS += -Wl,-rpath=${APPOUTPATH}:${LIBOUTPATH}:${DLLOUTPATH}

    contains(CVER, 64) {
        DEFINES += __MACX_GXX_64
        
        LIBSLIST += -L$${LIBOUTPATH} \
                    -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __MACX_GXX_32

        LIBSLIST += -L$${LIBOUTPATH} \
                    -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}
    QMAKE_LFLAGS += -Wl,-rpath=./:./lib:./plugin

    contains(CVER, 64) {
        DEFINES += __MACX_GXX_64

        LIBSLIST += -L$${LIBOUTPATH} \
                    -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __MACX_GXX_32

        LIBSLIST += -L$${LIBOUTPATH} \
                    -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }
}
