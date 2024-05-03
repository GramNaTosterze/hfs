set(SOURCES fsck_hfs.c fsck_messages.c utilities.c)
set(MANPAGES fsck_hfs.8)

add_executable(fsck_hfs ${SOURCES})
target_include_directories(fsck_hfs PUBLIC ${CMAKE_SOURCE_DIR}/lib_fsck_hfs)
target_link_libraries(fsck_hfs dfa BlocksRuntime bsd pthread)