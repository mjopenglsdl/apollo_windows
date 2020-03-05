find_path(gtest_INCLUDE_DIR
        NAMES gtest.h
        PATHS /usr/include/gtest
        )

find_library(gtest_LIBRARY
        NAMES gtest
)


FIND_PACKAGE_HANDLE_STANDARD_ARGS(gtest REQUIRED_VARS gtest_INCLUDE_DIR gtest_LIBRARY)