find_path(glog_INCLUDE_DIR
        NAMES logging.h
        PATHS /usr/include/glog
        )

find_library(glog_LIBRARY
        NAMES glog
)


FIND_PACKAGE_HANDLE_STANDARD_ARGS(glog REQUIRED_VARS glog_INCLUDE_DIR glog_LIBRARY)


# message("!!!!!!! glog_INCLUDE_DIR: ${glog_INCLUDE_DIR}")
# message("!!!!!!! glog_LIBRARY: ${glog_LIBRARY}")
# message("!!!!!!! glog_FOUND: ${glog_FOUND}")