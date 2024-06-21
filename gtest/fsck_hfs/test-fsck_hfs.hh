#ifndef TEST_FSCK_HFS_HH
#define TEST_FSCK_HFS_HH

#include <gtest/gtest.h>

#include "../disk-image.h"

#ifndef FSCK_HFS

#if __linux__
#define FSCK_HFS "/usr/bin/fsck.hfs" // install directory
#else
#define FSCK_HFS "/usr/bin/fsck_hfs" // install directory
#endif

#endif

#endif //TEST-FSCK_HFS_HH
