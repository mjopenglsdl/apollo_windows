
file(GLOB_RECURSE APP_SRC_FILES "*.cc")

SET(APOLLO_APP "apollo_app")

# message("SRC_FILES: ${SRC_FILES}")

add_executable(${APOLLO_APP} ${APP_SRC_FILES})

# message(FATAL " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ${APOLLO_LIB}")

target_link_libraries(${APOLLO_APP} 
            ${APOLLO_LIB}
            )