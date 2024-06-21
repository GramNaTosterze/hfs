#include "test-fsck_hfs.hh"

TEST(fsck_hfs, Check) {
    GenerateTestImage();
    LoSetup();
    MountTestImage();
    
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s %s 2>&1", FSCK_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    ASSERT_EQ(system(cmd.c_str()), 0);

    DetachLo();
}