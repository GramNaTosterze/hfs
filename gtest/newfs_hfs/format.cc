#include "test-newfs_hfs.hh"

TEST(newfs_hfs, Format) {
    GenerateTestImage();
    LoSetup();
    MountTestImage();

    std::string cmd = std::format("{} -v TestPartition {}", NEWFS_HFS, MOUNT_POINT);
    ASSERT_EQ(system(cmd.c_str()), 0);

    DetachLo();
}