set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m64 -fPIC")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m64 -fPIC")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -Wl,-rpath=${APPOUTPATH}:${DLLOUTPATH}:${LIBOUTPATH}")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -Wall")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} -Wl,-rpath=./:./lib:./plugin")

set(LIBSUFFIX ".a")
set(DLLSUFFIX ".dll")

add_definitions(-D__WIN32)

if (CVER MATCHES "debug")
    set(OUTSUFFIX "${CPLATFORM}_${CCPU}_${CCOMPILE}_d")
    add_definitions(-D__DEBUG)
        
    set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
    set(LIBSLIST "${LIBSLIST}"
                 "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                 "example_dll_${OUTSUFFIX}"
    )

else ()
    set(OUTSUFFIX "${CPLATFORM}_${CCPU}_${CCOMPILE}")
    
    set(LIBDIRLIST "${LIBOUTPATH} ${DLLOUTPATH}")
    set(LIBSLIST "${LIBSLIST}"
                 "${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                 "example_dll_${OUTSUFFIX}"
    )
endif ()