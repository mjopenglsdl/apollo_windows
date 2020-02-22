
add_subdirectory(proto)

find_package(glog REQUIRED)
find_package(gflags REQUIRED)
find_package(gtest REQUIRED)

find_package(Protobuf REQUIRED)
find_package(fastcdr REQUIRED)
find_package(fastrtps REQUIRED)
find_package(Poco REQUIRED Foundation)


# cyber lib
file(GLOB_RECURSE SRC_FILES "*.cc")
 

# message("SRC_FILES: ${SRC_FILES}")

add_library(${CYBER_LIB} SHARED ${SRC_FILES})
target_link_libraries(${CYBER_LIB} glog gtest ${PROTOBUF_LIBRARIES} fastcdr fastrtps
            Poco::Foundation gflags pcrecpp atomic)