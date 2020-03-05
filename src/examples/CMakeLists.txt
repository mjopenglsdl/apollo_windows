
add_subdirectory(proto)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proto")

if(WIN32)
    include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proto/win")
    file(GLOB_RECURSE PROTO_SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/proto/win/*.cc")

else()
    include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proto/linux")
    file(GLOB_RECURSE PROTO_SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/proto/linux/*.cc")
endif()


# message("SRC_FILES: ${SRC_FILES}")
SET(TARGET_TALKER "talker")
add_executable(${TARGET_TALKER} "talker.cc" ${PROTO_SRC_FILES})
target_link_libraries(${TARGET_TALKER} ${CYBER_LIB})

# message(FATAL " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ${CYBER_LIB}")

SET(TARGET_LISTENER "listener")
add_executable(${TARGET_LISTENER} "listener.cc" ${PROTO_SRC_FILES})
target_link_libraries(${TARGET_LISTENER} ${CYBER_LIB})