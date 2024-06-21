#include <gtest/gtest.h>
#include <sys/mount.h>

#include "disk-image.h"

void GenerateTestImage() {
    std::string cmd = std::format("dd if=/dev/urandom of={} bs=1M count=1024", TEST_IMAGE);
    ASSERT_EQ(system(cmd.c_str()), 0);
}

void LoSetup() {
    std::string cmd = std::format("losetup {} {}", MOUNT_POINT, TEST_IMAGE);
    ASSERT_EQ(system(cmd.c_str()), 0);
}

void MountTestImage() {
    //mount();
}

void DetachLo() {
    std::string cmd = std::format("losetup -d {}", MOUNT_POINT);
    ASSERT_EQ(system(cmd.c_str()), 0);
}
