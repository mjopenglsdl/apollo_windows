find_path(uuid_INCLUDE_DIR
        NAMES uuid.h
        PATHS /usr/include/uuid
        )

find_library(uuid_LIBRARY
        NAMES uuid
)


FIND_PACKAGE_HANDLE_STANDARD_ARGS(uuid REQUIRED_VARS uuid_INCLUDE_DIR uuid_LIBRARY)