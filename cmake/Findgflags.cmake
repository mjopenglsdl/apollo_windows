find_path(gflags_INCLUDE_DIR
        NAMES gflags.h
        PATHS /usr/include/gflags
        )

find_library(gflags_LIBRARY
        NAMES gflags
)



FIND_PACKAGE_HANDLE_STANDARD_ARGS(gflags REQUIRED_VARS gflags_INCLUDE_DIR gflags_LIBRARY)