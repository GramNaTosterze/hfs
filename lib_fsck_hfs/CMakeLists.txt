set(SOURCES cache.c check.c fsck_debug.c fsck_hfs_strings.c fsck_journal.c fsck_strings.c lib_fsck_hfs.c)

add_subdirectory(dfalib)

add_library(libfsck ${SOURCES})