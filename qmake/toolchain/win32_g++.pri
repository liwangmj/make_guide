LIBSUFFIX = .a
DLLSUFFIX = .dll

CONFIG(debug, debug|release) {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}_d
    DEFINES += __DEBUG

    contains(CVER, 64) {
        DEFINES += __WIN32_GXX_64
        
        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_GXX_32

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }

} else {
    OUTSUFFIX = $${CPLATFORM}_$${CCOMPILE}_$${CCPU}

    contains(CVER, 64) {
        DEFINES += __WIN32_GXX_64

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}

    } else {
        DEFINES += __WIN32_GXX_32

        LIBSLIST += $${LIBOUTPATH}/libexample_lib_$${OUTSUFFIX}$${LIBSUFFIX}
        LIBSLIST += -L$${DLLOUTPATH} \
                    -lexample_dll_$${OUTSUFFIX}
    }
}
