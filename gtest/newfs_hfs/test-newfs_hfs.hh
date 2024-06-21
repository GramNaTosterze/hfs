#ifndef TEST_NEWFS_HFS_HH
#define TEST_NEWFS_HFS_HH

#include <gtest/gtest.h>

#include "../disk-image.h"

#ifndef NEWFS_HFS

#if __linux__
#define NEWFS_HFS "/usr/bin/mkfs.hfs" // install directory
#else
#define NEWFS_HFS "/usr/bin/newfs_hfs" // install directory
#endif

#endif

#endif //TEST_NEWFS_HFS_HH