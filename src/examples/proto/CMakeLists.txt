
include("${PROJECT_SOURCE_DIR}/cmake/protobuf_util.cmake")

file(GLOB PROTO_RAW_FILES "*.proto")

# message("PROTO_RAW_FILES: ${PROTO_RAW_FILES}")

gen_proto_src_if_not_exist("examples" 1 ${PROTO_RAW_FILES})