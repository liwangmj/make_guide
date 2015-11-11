project(example_app)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../toolchain/Rules.cmake)

include_directories(${INCLUDELIST})
link_directories(${LIBDIRLIST})

aux_source_directory(. SRC_LIST)
file(GLOB_RECURSE MODULE_A_SRC_LIST "module_a/*.cpp")
file(GLOB_RECURSE MODULE_B_SRC_LIST "module_b/*.cpp")

set(EXECUTABLE_OUTPUT_PATH "${APPOUTPATH}")

add_executable(${PROJECT_NAME} ${SRC_LIST} ${MODULE_A_SRC_LIST} ${MODULE_B_SRC_LIST})
target_link_libraries(${PROJECT_NAME} ${LIBSLIST})
