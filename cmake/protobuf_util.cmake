
find_package(Protobuf REQUIRED)

SET(Protobuf_IMPORT_DIRS "${Protobuf_IMPORT_DIRS} ../..")

include_directories("${PROJECT_SOURCE_DIR}")

# file(GLOB PROTO_RAW_FILES "cyber/proto/*.proto")


function(gen_proto_src_if_newer)    
    gen_proto_src(1 ${ARGV})
endfunction(gen_proto_src_if_newer) 

function(gen_proto_src_if_not_exist)
    gen_proto_src(0 ${ARGV})
endfunction(gen_proto_src_if_not_exist)



function(gen_proto_src)

    list(GET ARGV 0 USE_NEWER)
    list(GET ARGV 1 FOLDER_NAME)

    # message("USE_NEWER: ${USE_NEWER}")
    # message("FOLDER_NAME: ${FOLDER_NAME}")


    if(WIN32)
        set(PROTO_CPP_OUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/win")
    else(WIN32)
        set(PROTO_CPP_OUT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/linux")
    endif(WIN32)

    # message("--cpp_out PROTO_CPP_OUT_DIR: ${PROTO_CPP_OUT_DIR}")
    # message("--proto_path CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
    # message("-ARGV : ${ARGV}")

    set(INPUT_FILES ${ARGV})
    
    FOREACH(one_proto_file ${INPUT_FILES})
        string(LENGTH ${one_proto_file} STR_LEN)
        # message("STR_LEN: ${STR_LEN}")
        if(STR_LEN LESS 20)
            continue()
        endif()
        

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

        if(USE_NEWER)
            if(${PROTO_NATIVE_PATH} IS_NEWER_THAN ${GENERATED_FILE_PATH}) 
                # message("+++++++++++++++++ ${GENERATED_FILE_PATH}")
                # message("       !!!!!!!!!! PROTOBUF_PROTOC_EXECUTABLE: ${PROTOBUF_PROTOC_EXECUTABLE}")
                # message("       PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
                # message("       CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
                # message("       PROTO_NATIVE_PATH: ${PROTO_NATIVE_PATH}")

                EXECUTE_PROCESS(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} --proto_path=${PROJECT_SOURCE_DIR} --cpp_out=${PROTO_CPP_OUT_DIR} ${PROTO_NATIVE_PATH}
                RESULT_VARIABLE rv)

                # Optional, but that can show the user if something have gone wrong with the proto generation 
                IF(${rv})
                    MESSAGE("Generation of data model returned ${rv} for proto ${PROTO_CPP_OUT_DIR}")
                ENDIF()
            endif()

        else()
            if(EXISTS ${GENERATED_FILE_PATH}) 
                EXECUTE_PROCESS(COMMAND ${PROTOBUF_PROTOC_EXECUTABLE} --proto_path=${PROJECT_SOURCE_DIR} --cpp_out=${PROTO_CPP_OUT_DIR} ${PROTO_NATIVE_PATH}
                RESULT_VARIABLE rv)

                IF(${rv})
                    MESSAGE("Generation of data model returned ${rv} for proto ${PROTO_CPP_OUT_DIR}")
                ENDIF()
            endif()
        endif(USE_NEWER)
        
    ENDFOREACH(one_proto_file)
endfunction(gen_proto_src)