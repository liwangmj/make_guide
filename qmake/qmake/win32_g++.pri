CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}_d
    DEFINES += __DEBUG

    contains(CVER, 64) {
        DEFINES += __WIN32_G++_64
        
        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_G++_32

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}

    contains(CVER, 64) {
        DEFINES += __WIN32_G++_64

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_G++_32

        LIBSLIST = -L$${LIBOUTPATH} \
                   -lexample_lib_$${OUTSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }
}