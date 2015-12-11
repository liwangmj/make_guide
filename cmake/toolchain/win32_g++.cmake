set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g -fshort-wchar -fPIC")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -fshort-wchar -fPIC")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -fshort-wchar -O3 -Wall -fPIC")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -fshort-wchar -O3 -Wall -fPIC")

set(LIBSUFFIX ".a")
set(DLLSUFFIX ".dll")

if (CVER MATCHES "debug")
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}_d")
    add_definitions(-D__DEBUG)

    if (CVER EQUAL 64)
        add_definitions(-D__WIN32_GXX_64)
        
        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__WIN32_GXX_32)

        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()

else ()
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}")

    if (CVER EQUAL 64)
        add_definitions(-D__WIN32_GXX_64)
        
        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__WIN32_GXX_32)

        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()
endif ()
