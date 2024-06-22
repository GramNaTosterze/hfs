#include "test-newfs_hfs.hh"

#if __linux__
#define NEWFS_HFS_BIN "mkfs.hfs"
#else
#define NEWFS_HFS_BIN "newfs_hfs"
#endif

TEST(newfs_hfs, NoDevice) {
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s -v TestPartition %s_no_dev 2>&1", NEWFS_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    std::array<char, 128> buffer{};
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd.c_str(), "r"), pclose);
    ASSERT_TRUE(pipe);

    while (fgets(buffer.data(), static_cast<int>(buffer.size()), pipe.get()) != nullptr) {
        result += buffer.data();
    }


    snprintf(buff.data(), buff.size(), "%s: cannot create filesystem on %s_no_dev: No such file or directory\n", NEWFS_HFS_BIN, MOUNT_POINT);

    std::string expected(buff.data());
    ASSERT_EQ(result,expected);
}