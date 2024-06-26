#include "test-fsck_hfs.hh"
#include <gtest/gtest.h>

TEST(fsck_hfs, NoHFSPartition) {
    if (GenerateTestImage() + LoSetup() + MountTestImage() != 0) {
        DetachLo();
        GTEST_SKIP_("Cannot create Test image");
    }

    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s %s -y 2>&1", FSCK_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    ASSERT_EQ(system(cmd.c_str()), 2048);
    DetachLo();
}
