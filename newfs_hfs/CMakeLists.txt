set(SOURCES hfs_endian.c makehfs.c newfs_hfs.c)
set(MANPAGES newfs_hfs.8)

add_executable(newfs_hfs ${SOURCES})

if(APPLE)
    #TODO
elseif(UNIX)
    target_link_libraries(newfs_hfs bsd)
endif()

