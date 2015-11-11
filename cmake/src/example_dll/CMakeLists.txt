project(example_dll_${OUTSUFFIX})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../toolchain/Rules.cmake)

include_directories(${INCLUDELIST})

aux_source_directory(. SRC_LIST)

add_library(${PROJECT_NAME} SHARED ${SRC_LIST})

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ${DLLSUFFIX})
#set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.2 SOVERSION 1)
set(LIBRARY_OUTPUT_PATH "${DLLOUTPATH}")
