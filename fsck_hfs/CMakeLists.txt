set(TARGET fsck_hfs)
set(SOURCES fsck_hfs.c fsck_messages.c utilities.c)
set(MANPAGES fsck_hfs.8)

add_executable(${TARGET} ${SOURCES})
target_include_directories(${TARGET} PUBLIC ${CMAKE_SOURCE_DIR}/lib_fsck_hfs)

if(APPLE)
    #TODO
elseif(UNIX)
    target_link_libraries(${TARGET} dfa BlocksRuntime bsd pthread)
endif()
