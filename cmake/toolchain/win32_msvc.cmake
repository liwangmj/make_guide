set(APPOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}")
set(DLLOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}")
set(LIBOUTPATH "${PROJECTPATH}/lib/${CPLATFORM}_${CCOMPILE}_${CCPU}")

#set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /Zi /MDd")
#set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /Zi /MDd")
#set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} /NODEFAULTLIB:libcmtd.lib /NODEFAULTLIB:msvcrtd.lib"
#set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} /O2 /MD")
#set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /O2 /MD")
#set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /NODEFAULTLIB:libc.lib /NODEFAULTLIB:libcmt.lib /NODEFAULTLIB:msvcrt.lib"

set(LIBSUFFIX ".lib")
set(DLLSUFFIX ".dll")

if (CVER MATCHES "debug")
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}_d")
    add_definitions(-D__DEBUG)

    if (CVER EQUAL 64)
        add_definitions(-D__WIN32_MSVC_64)
        
        set(LIBDIRLIST "${LIBOUTPATH}/${CVER} ${DLLOUTPATH}/${CVER}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/${CVER}/example_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__WIN32_MSVC_32)

        set(LIBDIRLIST "${LIBOUTPATH}/${CVER} ${DLLOUTPATH}/${CVER}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/${CVER}/example_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()

else ()
    set(OUTSUFFIX "${CPLATFORM}_${CCOMPILE}_${CCPU}")

    if (CVER EQUAL 64)
        add_definitions(-D__WIN32_MSVC_64)
        
        set(LIBDIRLIST "${LIBOUTPATH}/${CVER} ${DLLOUTPATH}/${CVER}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/${CVER}/example_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )

    else ()
        add_definitions(-D__WIN32_MSVC_32)

        set(LIBDIRLIST "${LIBOUTPATH}/${CVER} ${DLLOUTPATH}/${CVER}")
        set(LIBSLIST "${LIBSLIST}"
                     "${LIBOUTPATH}/${CVER}/example_lib_${OUTSUFFIX}${LIBSUFFIX}"
                     "example_dll_${OUTSUFFIX}"
        )
    endif ()
endif ()
