
find_package(Protobuf REQUIRED)

SET(Protobuf_IMPORT_DIRS "${Protobuf_IMPORT_DIRS} ../..")

include_directories("${PROJECT_SOURCE_DIR}")

# file(GLOB PROTO_RAW_FILES "cyber/proto/*.proto")


# list(GET <list> <element index> [<element index> ...] <output variable>)


function(gen_proto_src FOLDER_NAME)

    # message("FOLDER_NAME: ${FOLDER_NAME}")
    list(SUBLIST ARGV 1  -1 INPUT_FILES)
    # message("INPUT_FILES: ${INPUT_FILES}")

    FOREACH(one_proto_file ${INPUT_FILES})
        file(TO_NATIVE_PATH ${one_proto_file} PROTO_NATIVE_PATH)

        # message("   PROTO_NATIVE_PATH: ${PROTO_NATIVE_PATH}")

        string(FIND  ${PROTO_NATIVE_PATH} "/proto/" IDX_PROTO)
        # message("0000000 IDX_PROTO: ${IDX_PROTO}")

        # generate cpp file path
        string(SUBSTRING ${PROTO_NATIVE_PATH} ${IDX_PROTO} -1 GEN_PROTO_FILE_NAME)
        string(REPLACE "/proto/" "" GEN_PROTO_FILE_NAME ${GEN_PROTO_FILE_NAME})
        string(REPLACE ".proto" ".pb.h" GEN_PROTO_FILE_NAME ${GEN_PROTO_FILE_NAME})
        # message("0000000 GEN_PROTO_FILE_NAME: ${GEN_PROTO_FILE_NAME}")

        set(GENERATED_FILE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${FOLDER_NAME}/proto/${GEN_PROTO_FILE_NAME}")
        # message("   generated file path: ${GENERATED_FILE_PATH}")  
        # file(TO_NATIVE_PATH ${GENERATED_FILE_PATH} GENERATED_FILE_PATH)

        # message("!!! PROTO_NATIVE_PATH: ${PROTO_NATIVE_PATH}")
        # message("!!! GENERATED_FILE_PATH: ${GENERATED_FILE_PATH}")

        if(${PROTO_NATIVE_PATH} IS_NEWER_THAN ${GENERATED_FILE_PATH}) 
            # message("+++++++++++++++++ ${GENERATED_FILE_PATH}")
            # message("       PROTOBUF_PROTOC_EXECUTABLE: ${PROTOBUF_PROTOC_EXECUTABLE}")
            # message("       PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
            # message("       CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
            # message("       PROTO_NATIVE_PATH: ${PROTO_NATIVE_PATH}")

            EXECUTE_PROCESS(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} --proto_path=${PROJECT_SOURCE_DIR} --cpp_out=${CMAKE_CURRENT_SOURCE_DIR} ${PROTO_NATIVE_PATH}
            RESULT_VARIABLE rv)

            # Optional, but that can show the user if something have gone wrong with the proto generation 
            IF(${rv})
                MESSAGE("Generation of data model returned ${rv} for proto ${PROTO_NATIVE_PATH}")
            ENDIF()
        endif()

    ENDFOREACH(one_proto_file)

endfunction(gen_proto_src) 
