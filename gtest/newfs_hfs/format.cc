#include "test-newfs_hfs.hh"

TEST(newfs_hfs, Format) {
    GenerateTestImage();
    LoSetup();
    MountTestImage();

    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s -v TestPartition %s", NEWFS_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    ASSERT_GE(system(cmd.c_str()), 0);
    
    DetachLo();
}