/*
 * Copyright (c) 2016 Apple, Inc. All rights reserved.
 *
 * Test HFS defrag fsctls 
 */

#include <sys/ioctl.h>
#if __linux__
#include <sys/statfs.h>
#else /*__APPLE__*/
#include <sys/ioccom.h>
#endif
#include <sys/param.h>
#include <sys/mount.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/errno.h>
#include <spawn.h>
#include <sys/stat.h>
#include <fcntl.h>

#if __linux__
#include "apple_types.h"
#endif
#include "../../core/hfs_fsctl.h"
#include "hfs-tests.h"
#include "test-utils.h"
#include "systemx.h"
#include "disk-image.h"

TEST(defrag, .run_as_root = true)

int run_defrag(__unused test_ctx_t *ctx)
{
	
	// The root file system needs to be HFS
	struct statfs sfs;

	assert(statfs("/tmp", &sfs) == 0);
#if __linux__
    if (sfs.f_type == /*HFS_SUPER_MAGIC*/ 0x4244) {
#else /*__APPLE__*/
	if (strcmp(sfs.f_fstypename, "hfs")) {
#endif
		printf("test-defrag needs hfs as root file system - skipping.\n");
		return 0;
	}

	/* These two should pass */
	uint32_t enable_defrag = 1;
#if __linux__
#else
    assert_no_err(fsctl("/tmp", HFSIOC_FORCE_ENABLE_DEFRAG, &enable_defrag, 0));
#endif
	uint32_t max_file_size = 50 * 1024 * 1024;
#if __linux__
#else
    assert_no_err(fsctl("/tmp", HFSIOC_SET_MAX_DEFRAG_SIZE, &max_file_size, 0));
#endif

	/* This should fail */
	max_file_size = 500 * 1024 * 1024;
#if __linux__
#else
	int err = fsctl("/tmp", HFSIOC_SET_MAX_DEFRAG_SIZE, &max_file_size, 0);
	if (err == 0){
		abort();	
	}
#endif
	return 0;
}
