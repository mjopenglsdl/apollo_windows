cmake_minimum_required(VERSION 3.1.3)

project(apollo_port)

if(WIN32)
    add_definitions("-DPOCO_WIN32_UTF8")
endif(WIN32)

include_directories("${PROJECT_SOURCE_DIR}/cyber/proto")
include_directories("${PROJECT_SOURCE_DIR}")


SET(APOLLO_LIB "apollo")

add_subdirectory(cyber)
 
add_subdirectory(mainboard)