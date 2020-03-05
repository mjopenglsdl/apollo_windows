cmake_minimum_required(VERSION 3.5.0)

project(apollo_windows)

set(CMAKE_CXX_STANDARD 14)

if(WIN32)
    add_definitions("-DPOCO_WIN32_UTF8")

    include_directories("${PROJECT_SOURCE_DIR}/cyber/proto/win")
else()
    include_directories("${PROJECT_SOURCE_DIR}/cyber/proto/linux")
endif()

include_directories("${PROJECT_SOURCE_DIR}")


# 
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

# output
set(CYBER_LIB "cyber")

set(EXECUTABLE_OUTPUT_PATH "${PROJECT_BINARY_DIR}/bin")
set(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/bin")


# lib 
add_subdirectory(cyber)

# exe
add_subdirectory(src)