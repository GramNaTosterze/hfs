cmake_minimum_required(VERSION 3.28)
project(HFSUtils)


set(CMAKE_CXX_STANDARD 26)
include_directories(include)
add_compile_options(-fblocks)

add_subdirectory(newfs_hfs)
add_subdirectory(lib_fsck_hfs)
add_subdirectory(fsck_hfs)

set_target_properties( newfs_hfs fsck_hfs dfa
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib
)

install(TARGETS newfs_hfs fsck_hfs)