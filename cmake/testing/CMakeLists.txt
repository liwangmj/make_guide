project(runtest)

include(${CMAKE_CURRENT_SOURCE_DIR}/../toolchain/Rules.cmake)

include_directories(${INCLUDELIST})
link_directories(${LIBDIRLIST})

aux_source_directory(. SRC_LIST)

set(EXECUTABLE_OUTPUT_PATH "${APPOUTPATH}")

add_executable(${PROJECT_NAME} ${SRC_LIST})
target_link_libraries(${PROJECT_NAME} ${LIBSLIST})

do_add_test(${PROJECT_NAME})
