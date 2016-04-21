set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -fshort-wchar")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -fshort-wchar")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -Wl,-rpath=${APPOUTPATH}:${DLLOUTPATH}:${LIBOUTPATH}")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -Wall")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} -Wl,-rpath=./:./lib:./plugin")

set(LIBSUFFIX ".a")
set(DLLSUFFIX ".so")

if (CVER MATCHES "debug")
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}_d")
    add_definitions(-D__DEBUG)

    if (CVER EQUAL 64)
        add_definitions(-D__LINUX_GXX_64)
        
        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__LINUX_GXX_32)

        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()

else ()
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}")

    if (CVER EQUAL 64)
        add_definitions(-D__LINUX_GXX_64)
        
        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__LINUX_GXX_32)

        set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()
endif ()
