cmake_minimum_required(VERSION 3.1.3)

project(apollo_windows)


if(WIN32)
add_definitions("-DPOCO_WIN32_UTF8")
endif(WIN32)

include_directories("${PROJECT_SOURCE_DIR}/cyber/proto")
include_directories("${PROJECT_SOURCE_DIR}")


SET(CYBER_LIB "cyber")

# lib 
add_subdirectory(cyber)

# exe
add_subdirectory(mainboard)
add_subdirectory(examples)  