cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/toolchain)
include(toolchain/Rules.cmake)

add_subdirectory(src/example_lib)
add_subdirectory(src/example_dll)
add_subdirectory(src/example_app)
