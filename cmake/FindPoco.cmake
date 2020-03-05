find_path(Poco_INCLUDE_DIR
        NAMES Poco.h
        PATHS /usr/include/Poco
        )

find_library(Poco_LIBRARY
        NAMES PocoFoundation
)


FIND_PACKAGE_HANDLE_STANDARD_ARGS(Poco REQUIRED_VARS Poco_INCLUDE_DIR Poco_LIBRARY)