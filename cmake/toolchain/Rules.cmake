set(PROJECTPATH ${CMAKE_SOURCE_DIR})

if (NOT CMAKE_BUILD_TYPE)
    option(BUILD_RELEASE "debug or release" ON)
endif ()

if (CMAKE_BUILD_TYPE MATCHES "debug")
    set(CVER "debug")
elseif (CMAKE_BUILD_TYPE MATCHES "release")
    set(CVER "release")
else ()
    if (BUILD_RELEASE)
        set(CVER "release")
    else ()
        set(CVER "debug")
    endif ()
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

enable_testing()

macro (DO_ADD_TEST RUNTESTNAME)
    add_test(NAME ${RUNTESTNAME}_noarg COMMAND ${RUNTESTNAME})
endmacro ()

macro (DO_ADD_TEST_1 RUNTESTNAME ARG1 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1} COMMAND ${RUNTESTNAME} ${ARG1})
    set_tests_properties(${RUNTESTNAME}_${ARG1}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_2 RUNTESTNAME ARG1 ARG2 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_3 RUNTESTNAME ARG1 ARG2 ARG3 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_4 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_5 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 ARG5 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4} ${ARG5})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_6 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 ARG5 ARG6 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4} ${ARG5} ${ARG6})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_7 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 ARG5 ARG6 ARG7 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4} ${ARG5} ${ARG6} ${ARG7})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_8 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 ARG5 ARG6 ARG7 ARG8 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7}_${ARG8} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4} ${ARG5} ${ARG6} ${ARG7} ${ARG8})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7}_${ARG8}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()

macro (DO_ADD_TEST_9 RUNTESTNAME ARG1 ARG2 ARG3 ARG4 ARG5 ARG6 ARG7 ARG8 ARG9 RESULT)
    add_test(NAME ${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7}_${ARG8}_${ARG9} COMMAND ${RUNTESTNAME} ${ARG1} ${ARG2} ${ARG3} ${ARG4} ${ARG5} ${ARG6} ${ARG7} ${ARG8} ${ARG9})
    set_tests_properties(${RUNTESTNAME}_${ARG1}_${ARG2}_${ARG3}_${ARG4}_${ARG5}_${ARG6}_${ARG7}_${ARG8}_${ARG9}
                         PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro ()
