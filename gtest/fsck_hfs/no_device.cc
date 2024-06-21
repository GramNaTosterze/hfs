#include "test-fsck_hfs.hh"
#include <cstdio>
#include <memory>

TEST(fsck_hfs, NoDevice) {
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "%s %s_no_dev 2>&1", FSCK_HFS, MOUNT_POINT);

    std::string cmd(buff.data());
    std::array<char, 128> buffer{};
    std::string result;
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd.c_str(), "r"), pclose);
    ASSERT_TRUE(pipe);

    while (fgets(buffer.data(), static_cast<int>(buffer.size()), pipe.get()) != nullptr) {
        result += buffer.data();
    }


    snprintf(buff.data(), buff.size(), "%s_no_dev: No such file or directory\nCan't stat %s_no_dev\nCan't open %s_no_dev: No such file or directory\n", MOUNT_POINT, MOUNT_POINT, MOUNT_POINT);
    std::string expected(buff.data());
    ASSERT_EQ(result,expected);
}