set(SOURCES hfs_endian.c makehfs.c newfs_hfs.c)
set(MANPAGES newfs_hfs.8)

add_executable(newfs_hfs ${SOURCES})

# debian - libbsd-dev
target_link_libraries(newfs_hfs bsd)
