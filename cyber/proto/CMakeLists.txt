
find_package(Protobuf REQUIRED)

# protos
SET(Protobuf_IMPORT_DIRS "${Protobuf_IMPORT_DIRS} ../..")

include_directories("${PROJECT_SOURCE_DIR}")
# include_directories("${PROJECT_SOURCE_DIR}/build")

# file(GLOB PROTO_RAW_FILES "cyber/proto/*.proto")
file(GLOB PROTO_RAW_FILES "*.proto")



# FILE(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/externals/protodef PROTOMODEL_PATH)
# FILE(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/generated PROTOBINDING_PATH)

FOREACH(one_proto_file ${PROTO_RAW_FILES})
   FILE(TO_NATIVE_PATH ${one_proto_file} proto_native)
   # message("!!! proto_native: ${one_proto_file}")
   EXECUTE_PROCESS(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} --proto_path=${PROJECT_SOURCE_DIR} --cpp_out=${CMAKE_CURRENT_SOURCE_DIR} ${one_proto_file}
   RESULT_VARIABLE rv)
   # Optional, but that can show the user if something have gone wrong with the proto generation 
   IF(${rv})
        MESSAGE("Generation of data model returned ${rv} for proto ${one_proto_file}")
   ENDIF()
ENDFOREACH(one_proto_file)


# # gen lib

# file(GLOB GEN_PROTO_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cyber/proto/*.cc")

# add_library(cyber_protos ${GEN_PROTO_FILES})