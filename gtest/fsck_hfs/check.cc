#include "test-fsck_hfs.hh"

TEST(fsck_hfs, Check) {
    GenerateTestImage();
    LoSetup();
    MountTestImage();
    
    std::string cmd = std::format("{} {}", FSCK_HFS, MOUNT_POINT);
    ASSERT_EQ(system(cmd.c_str()), 0);

    DetachLo();
}