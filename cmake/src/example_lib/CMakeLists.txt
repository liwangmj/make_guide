project(example_lib_${OUTSUFFIX})

include_directories(${INCLUDELIST})

aux_source_directory(. SRC_LIST)

add_library(${PROJECT_NAME} STATIC ${SRC_LIST})

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ${LIBSUFFIX})
set(LIBRARY_OUTPUT_PATH "${LIBOUTPATH}")
