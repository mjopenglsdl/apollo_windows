
# FILE(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/externals/protodef PROTOMODEL_PATH)
# FILE(TO_NATIVE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/src/generated PROTOBINDING_PATH)

include("${PROJECT_SOURCE_DIR}/cmake/protobuf_util.cmake")


file(GLOB PROTO_RAW_FILES "*.proto")

gen_proto_src("cyber" ${PROTO_RAW_FILES})


# # gen lib

# file(GLOB GEN_PROTO_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cyber/proto/*.cc")

# add_library(cyber_protos ${GEN_PROTO_FILES})