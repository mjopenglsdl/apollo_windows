
file(GLOB_RECURSE APP_SRC_FILES "*.cc")

SET(MAIN_BOARD "mainboard")

# message("SRC_FILES: ${SRC_FILES}")

add_executable(${MAIN_BOARD} ${APP_SRC_FILES})

# message(FATAL " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ${CYBER_LIB}")

target_link_libraries(${MAIN_BOARD} ${CYBER_LIB})