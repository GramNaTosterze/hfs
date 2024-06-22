#include "test-newfs_hfs.hh"

TEST(newfs_hfs, Format) {
    if (GenerateTestImage() + LoSetup() + MountTestImage() != 0) {
        DetachLo();
        GTEST_SKIP_("Cannot create Test image");
    }

    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s -v TestPartition %s", NEWFS_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    ASSERT_GE(system(cmd.c_str()), 0);
    
    DetachLo();
}