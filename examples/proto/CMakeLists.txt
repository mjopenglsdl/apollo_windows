
include("${PROJECT_SOURCE_DIR}/cmake/protobuf_util.cmake")

file(GLOB PROTO_RAW_FILES "*.proto")

gen_proto_src(${PROTO_RAW_FILES})