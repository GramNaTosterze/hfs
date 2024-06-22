#ifndef HFSUTILS_DISK_IMAGE_H
#define HFSUTILS_DISK_IMAGE_H

#include <memory>
#include <stdexcept>
#include <string>

#ifndef TEST_IMAGE // should be set by cmake
#define TEST_IMAGE "./test-image.img"
#endif

#ifndef MOUNT_POINT
#define MOUNT_POINT "/dev/loop0"
#endif

int GenerateTestImage();
int LoSetup();
int MountTestImage();
int DetachLo();

#endif //HFSUTILS_DISK_IMAGE_H
