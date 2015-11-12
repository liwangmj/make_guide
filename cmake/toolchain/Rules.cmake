set(PROJECTPATH ${CMAKE_SOURCE_DIR})
 
if (CMAKE_BUILD_TYPE MATCHES "debug")
    set(CVER "debug")
else ()
    set(CVER "release")
endif ()

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(CCPU 64)
elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(CCPU 32)
else ()
    set(CCPU 32)
endif ()

if (CMAKE_COMPILER_IS_GNUCXX)
    set(CCOMPILE "g++")
elseif (CMAKE_COMPILER_IS_GNUCC)
    set(CCOMPILE "gcc")
elseif (CMAKE_COMPILER_IS_CLANGXX)
    set(CCOMPILE "clang")
elseif (MSVC)
    set(CCOMPILE "msvc")
endif ()

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
    add_definitions(-D__LINUX)
    set(CPLATFORM "linux")
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
    add_definitions(-D__WIN32)
    set(CPLATFORM "win32")
elseif (CMAKE_SYSTEM_NAME MATCHES "Darwin")
    add_definitions(-D__MACX)
    set(CPLATFORM "macx")
else ()
    add_definitions(-D__UNIX)
    set(CPLATFORM "unix")
endif ()

set(APPOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")
set(DLLOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")
set(LIBOUTPATH "${PROJECTPATH}/lib/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")

set(INCLUDELIST "${INCLUDELIST}"
                "${PROJECTPATH}/include/example_lib"
                "${PROJECTPATH}/include/example_dll"
)

include(${PROJECTPATH}/toolchain/${CPLATFORM}_${CCOMPILE}.cmake)

install(DIRECTORY ${APPOUTPATH}/ DESTINATION bin
                                 PATTERN "*"
                                 PERMISSIONS OWNER_EXECUTE
                                             OWNER_WRITE
                                             OWNER_READ
                                             GROUP_EXECUTE
                                             GROUP_READ
                                             WORLD_EXECUTE
                                             WORLD_READ
)
install(DIRECTORY ${DLLOUTPATH}/ DESTINATION lib
                                 PATTERN "*"
                                 PERMISSIONS OWNER_EXECUTE
                                             OWNER_WRITE
                                             OWNER_READ
                                             GROUP_EXECUTE
                                             GROUP_READ
                                             WORLD_EXECUTE
                                             WORLD_READ
)
install(DIRECTORY ${LIBOUTPATH}/ DESTINATION lib
                                 PATTERN "*"
                                 PERMISSIONS OWNER_EXECUTE
                                             OWNER_WRITE
                                             OWNER_READ
                                             GROUP_EXECUTE
                                             GROUP_READ
                                             WORLD_EXECUTE
                                             WORLD_READ
)
install(DIRECTORY ${PROJECTPATH}/include/ DESTINATION include
                                 PATTERN "*"
                                 PERMISSIONS OWNER_EXECUTE
                                             OWNER_WRITE
                                             OWNER_READ
                                             GROUP_EXECUTE
                                             GROUP_READ
                                             WORLD_EXECUTE
                                             WORLD_READ
)
