cmake_minimum_required(VERSION 3.22)
project(HFSUtils)

enable_testing()

set(CMAKE_CXX_STANDARD 20)
include_directories(include)
add_compile_options(-fblocks)

add_subdirectory(newfs_hfs)
add_subdirectory(lib_fsck_hfs)
add_subdirectory(fsck_hfs)

add_subdirectory(gtest)

set_target_properties( newfs_hfs fsck_hfs dfa
        PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib
)

install(TARGETS newfs_hfs COMPONENT newfs_hfs)
install(TARGETS fsck_hfs COMPONENT fsck_hfs)