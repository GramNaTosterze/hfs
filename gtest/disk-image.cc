#include <cstdio>
#include <gtest/gtest.h>
#include <sys/mount.h>

#include "disk-image.h"

int GenerateTestImage() {
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "dd if=/dev/urandom of=%s bs=1M count=1024", TEST_IMAGE);

    std::string cmd(buff.data());
    return system(cmd.c_str());
}

int LoSetup() {
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "losetup %s %s", MOUNT_POINT, TEST_IMAGE);

    std::string cmd(buff.data());
    return system(cmd.c_str());
}

int MountTestImage() {
    //mount();
    return 0;
}

int DetachLo() {
    std::array<char, 256> buff{};
    snprintf(buff.data(), buff.size(), "losetup -d %s", MOUNT_POINT);

    std::string cmd(buff.data());
    return system(cmd.c_str());
}

