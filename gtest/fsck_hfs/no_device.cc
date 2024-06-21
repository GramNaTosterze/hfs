#include "test-fsck_hfs.hh"

TEST(fsck_hfs, NoDevice) {
    std::string cmd = std::format("{} {}_no_dev 2>&1", MOUNT_POINT, MOUNT_POINT);
    std::array<char, 128> buffer{};
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd.c_str(), "r"), pclose);
    ASSERT_TRUE(pipe);

    while (fgets(buffer.data(), static_cast<int>(buffer.size()), pipe.get()) != nullptr) {
        result += buffer.data();
    }


    //std::string expected = std::format( "newfs_hfs: cannot create filesystem on {}_no_dev: No such file or directory\n", MOUNT_POINT);
    //ASSERT_EQ(result,expected);
}