

find_package(GTest REQUIRED)

set(SOURCES
    hfs-tests.cc disk-image.cc
    newfs_hfs/format.cc newfs_hfs/no_device.cc
    fsck_hfs/check.cc fsck_hfs/no_device.cc
    )

add_executable(hfs-tests ${SOURCES})
add_dependencies(hfs-tests newfs_hfs fsck_hfs)
target_link_libraries(hfs-tests gtest)
target_compile_options(hfs-tests 
        PUBLIC -fexperimental-library
        )

target_compile_definitions(hfs-tests
        PUBLIC TEST_IMAGE="${CMAKE_BINARY_DIR}/test-image.img"
        NEWFS_HFS="${CMAKE_SOURCE_DIR}/bin/newfs_hfs" FSCK_HFS="${CMAKE_SOURCE_DIR}/bin/fsck_hfs"
        )

gtest_add_tests(
        TARGET hfs-tests
        )