set(APPOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCPU}_${CCOMPILE}/")
set(DLLOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCPU}_${CCOMPILE}/")
set(LIBOUTPATH "${PROJECTPATH}/lib/${CPLATFORM}_${CCPU}_${CCOMPILE}/")

SET(CMAKE_INSTALL_NAME_DIR "@rpath/")

#set(CMAKE_C_COMPILER "gcc")
#set(CMAKE_CXX_COMPILER "g++")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fobjc-abi-version=2 -fobjc-arc -isysroot ${CMAKE_OSX_SYSROOT}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fobjc-abi-version=2 -fobjc-arc -std=gnu++11 -stdlib=libc++ -isysroot ${CMAKE_OSX_SYSROOT}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-rpath,@loader_path,-rpath,@executable_path")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2 -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O2 -Wall")

set(CMAKE_SKIP_BUILD_RPATH FALSE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)

set(LIBSUFFIX ".a")
set(DLLSUFFIX ".dylib")

add_definitions(-D__IOS)

if (CVER MATCHES "debug")
    set(OUTSUFFIX "${CPLATFORM}_${CCPU}_${CCOMPILE}_d")
    add_definitions(-D__DEBUG)
    
    set(LIBDIRLIST "${LIBOUTPATH}/${CVER}/ ${DLLOUTPATH}/${CVER}/")
    set(LIBSLIST "${LIBSLIST}"
                 "${LIBOUTPATH}/${CVER}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                 "example_dll_${OUTSUFFIX}"
    )

else ()
    set(OUTSUFFIX "${CPLATFORM}_${CCPU}_${CCOMPILE}")
    
    set(LIBDIRLIST "${LIBOUTPATH}/${CVER}/ ${DLLOUTPATH}/${CVER}/")
    set(LIBSLIST "${LIBSLIST}"
                 "${LIBOUTPATH}/${CVER}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}"
                 "example_dll_${OUTSUFFIX}"
    )
endif ()
