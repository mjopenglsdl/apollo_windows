
find_package(Protobuf REQUIRED)

SET(Protobuf_IMPORT_DIRS "${Protobuf_IMPORT_DIRS} ../..")

include_directories("${PROJECT_SOURCE_DIR}")
# include_directories("${PROJECT_SOURCE_DIR}/build")

# file(GLOB PROTO_RAW_FILES "cyber/proto/*.proto")


function(gen_proto_src)

    FOREACH(one_proto_file ${ARGV})
        FILE(TO_NATIVE_PATH ${one_proto_file} proto_native)
        # message("!!! proto_native: ${one_proto_file}")
        EXECUTE_PROCESS(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} --proto_path=${PROJECT_SOURCE_DIR} --cpp_out=${CMAKE_CURRENT_SOURCE_DIR} ${one_proto_file}
        RESULT_VARIABLE rv)
        # Optional, but that can show the user if something have gone wrong with the proto generation 
        IF(${rv})
            MESSAGE("Generation of data model returned ${rv} for proto ${one_proto_file}")
        ENDIF()
    ENDFOREACH(one_proto_file)

endfunction(gen_proto_src)
