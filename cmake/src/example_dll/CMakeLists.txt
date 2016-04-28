project(example_dll_${OUTSUFFIX})

include_directories(${INCLUDELIST})
add_definitions(-D__DLL_LIBRARY)

aux_source_directory(. SRC_LIST)

add_library(${PROJECT_NAME} SHARED ${SRC_LIST})

if (CPLATFORM MATCHES "ios")
    set_xcode_property (${PROJECT_NAME} GCC_GENERATE_DEBUGGING_SYMBOLS YES)
endif ()

if (CPLATFORM MATCHES "win32")
else ()
#    target_link_libraries(${PROJECT_NAME} ${${PROJECT_NAME}_EXTRA_LDFLAGS}
#                                          "-Wl,--whole-archive"
#                                          ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}${LIBSUFFIX}
#                                          "-Wl,--no-whole-archive"
#    )
endif ()


set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ${DLLSUFFIX})
#set_target_properties(${PROJECT_NAME} PROPERTIES VERSION 1.2 SOVERSION 1)
set(LIBRARY_OUTPUT_PATH "${DLLOUTPATH}")
