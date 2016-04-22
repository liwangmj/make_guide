set(PROJECTPATH ${CMAKE_SOURCE_DIR})

if (NOT DEFINED CVER)
    set(CVER "release")
    message("[WARNING] NOT DEFINED 'CVER'. Default '${CVER}'")
endif ()

if (NOT DEFINED CCPU)
    set(CCPU "64")
    message("[WARNING] NOT DEFINED 'CCPU'. Default '${CCPU}'")
endif ()

if (NOT DEFINED CCOMPILE)
    set(CCOMPILE "g++")
    message("[WARNING] NOT DEFINED 'CCOMPILE'. Default '${CCOMPILE}'")
endif ()

if (NOT DEFINED CPLATFORM)
    set(CPLATFORM "linux")
    message("[WARNING] NOT DEFINED 'CPLATFORM'. Default '${CPLATFORM}'")
endif ()

message(STATUS "[INFO] CVER is: ${CVER}")
message(STATUS "[INFO] CCPU is: ${CCPU}")
message(STATUS "[INFO] CCOMPILE is: ${CCOMPILE}")
message(STATUS "[INFO] CPLATFORM is: ${CPLATFORM}")

set(CMAKE_INSTALL_PREFIX "${PROJECTPATH}/packaging")

set(APPOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")
set(DLLOUTPATH "${PROJECTPATH}/bin/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")
set(LIBOUTPATH "${PROJECTPATH}/lib/${CPLATFORM}_${CCOMPILE}_${CCPU}/${CVER}")

set(INCLUDELIST "${INCLUDELIST}"
                "${PROJECTPATH}/include/example_lib"
                "${PROJECTPATH}/include/example_dll"
)

include(${PROJECTPATH}/toolchain/${CPLATFORM}_${CCOMPILE}.cmake)

install(DIRECTORY ${APPOUTPATH}/
                  DESTINATION bin
                  PATTERN "*"
                  PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                              GROUP_EXECUTE GROUP_READ
                              WORLD_EXECUTE WORLD_READ
)
install(DIRECTORY ${DLLOUTPATH}/
                  DESTINATION lib
                  PATTERN "*"
                  PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                              GROUP_EXECUTE GROUP_READ
                              WORLD_EXECUTE WORLD_READ
)
install(DIRECTORY ${LIBOUTPATH}/
                  DESTINATION lib
                  PATTERN "*"
                  PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                              GROUP_EXECUTE GROUP_READ
                              WORLD_EXECUTE WORLD_READ
)
install(DIRECTORY ${PROJECTPATH}/include/
                  DESTINATION include
                  PATTERN "*"
                  PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                              GROUP_EXECUTE GROUP_READ
                              WORLD_EXECUTE WORLD_READ
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
