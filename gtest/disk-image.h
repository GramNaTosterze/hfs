#ifndef HFSUTILS_DISK_IMAGE_H
#define HFSUTILS_DISK_IMAGE_H

#ifndef TEST_IMAGE // should be set by cmake
#define TEST_IMAGE "./test-image.img"
#endif

#ifndef MOUNT_POINT
#define MOUNT_POINT "/dev/loop0"
#endif

void GenerateTestImage();
void LoSetup();
void MountTestImage();
void DetachLo();

#endif //HFSUTILS_DISK_IMAGE_H
