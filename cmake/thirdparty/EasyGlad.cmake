#
# Copyright(c) 2019 Hao Peng<ph1994wh@gmail.com>.
# Distributed under the BSD License 
#

set(GLAD_DIR "${ELIB_EXTERNAL_DIR}/glad")

if(NOT TARGET glad)
    message(STATUS "Downloading glad to ${GLAD_DIR}" )
    download_glad()
    file(GLOB GLAD_SOURCE "${GLAD_DIR}/src/glad.c")
    add_library(glad STATIC ${GLAD_SOURCE})
    set(GLAD_INCLUDE_DIR "${GLAD_DIR}/include")
    target_include_directories(glad PUBLIC ${GLAD_INCLUDE_DIR})
endif()
compile_module("glad")
target_link_libraries(elib_glad ${ELIB_SCOPE} glad)
target_include_directories(elib_glad ${ELIB_SCOPE} ${GLAD_INCLUDE_DIR})