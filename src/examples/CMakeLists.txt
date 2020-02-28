
add_subdirectory(proto)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proto")
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/proto/src")

file(GLOB_RECURSE PROTO_SRC_FILES "${CMAKE_CURRENT_SOURCE_DIR}/proto/*.cc")


# message("SRC_FILES: ${SRC_FILES}")
SET(TARGET_TALKER "talker")
add_executable(${TARGET_TALKER} "talker.cc" ${PROTO_SRC_FILES})
target_link_libraries(${TARGET_TALKER} ${CYBER_LIB})

# message(FATAL " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ${CYBER_LIB}")

SET(TARGET_LISTENER "listener")
add_executable(${TARGET_LISTENER} "listener.cc" ${PROTO_SRC_FILES})
target_link_libraries(${TARGET_LISTENER} ${CYBER_LIB})