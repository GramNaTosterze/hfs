set(TARGET newfs_hfs)
set(SOURCES hfs_endian.c makehfs.c newfs_hfs.c)
set(MANPAGES newfs_hfs.8)

add_executable(${TARGET} ${SOURCES})

if(APPLE)
    target_link_libraries(${TARGET}  util)
elseif(UNIX)
    target_link_libraries(${TARGET} bsd)
    set_target_properties(${TARGET} PROPERTIES OUTPUT_NAME "mkfs.hfs")
endif()

