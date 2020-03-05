
add_subdirectory(proto)

if(UNIX)
    set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${PROJECT_SOURCE_DIR}/cmake")
endif(UNIX)


find_package(glog REQUIRED)
find_package(gtest REQUIRED)
find_package(gflags REQUIRED)

find_package(Protobuf REQUIRED)
find_package(Poco REQUIRED Foundation)
find_package(fastcdr REQUIRED)
find_package(fastrtps REQUIRED)

 
# cyber lib
file(GLOB_RECURSE CYBER_SRC_FILES 
            "${PROJECT_SOURCE_DIR}/cyber/blocker/**.cc" 
            "${PROJECT_SOURCE_DIR}/cyber/class_loader/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/common/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/component/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/croutine/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/data/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/event/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/logger/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/message/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/node/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/scheduler/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/service_discovery/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/sysmo/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/task/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/time/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/timer/**.cc"
            "${PROJECT_SOURCE_DIR}/cyber/transport/**.cc"
        )

file(GLOB CYBER_ROOT_SRC_FILES "${PROJECT_SOURCE_DIR}/cyber/*.cc")


if(WIN32)
    file(GLOB_RECURSE PROTO_SRC_FILES "${PROJECT_SOURCE_DIR}/cyber/proto/win/**.cc")
else()
    file(GLOB_RECURSE PROTO_SRC_FILES "${PROJECT_SOURCE_DIR}/cyber/proto/linux/**.cc")
endif(WIN32)


add_library(${CYBER_LIB} SHARED ${CYBER_SRC_FILES} ${CYBER_ROOT_SRC_FILES} ${PROTO_SRC_FILES})


if(WIN32)
    target_link_libraries(${CYBER_LIB} glog gtest gflags
                    ${PROTOBUF_LIBRARIES} fastcdr fastrtps Poco::Foundation atomic)
else()
    target_link_libraries(${CYBER_LIB} ${glog_LIBRARY} ${gtest_LIBRARY} ${gflags_LIBRARY} 
                    ${PROTOBUF_LIBRARIES} fastcdr fastrtps ${Poco_LIBRARY} atomic)
endif()


target_compile_definitions(${CYBER_LIB} PUBLIC "CYBER_EXPORTS")