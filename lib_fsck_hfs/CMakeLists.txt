set(SOURCES cache.c check.c fsck_debug.c fsck_hfs_strings.c fsck_strings.c lib_fsck_hfs.c
        fsck_journal.c
        # dfalib sources
        dfalib/BlockCache.c dfalib/BTree.c dfalib/BTreeAllocate.c dfalib/BTreeMiscOps.c dfalib/BTreeScanner.c dfalib/BTreeTreeOps.c dfalib/BTreeNodeOps.c
        dfalib/CatalogCheck.c dfalib/DecompData.h dfalib/DecompMakeData.c
        dfalib/dirhardlink.c dfalib/HardLinkCheck.c dfalib/hfs_endian.c dfalib/SAllocate.c dfalib/SBTree.c
        dfalib/SCatalog.c dfalib/SControl.c dfalib/SDevice.c dfalib/SExtents.c dfalib/SKeyCompare.c dfalib/SRebuildBTree.c dfalib/SRepair.c dfalib/SStubs.c dfalib/SUtils.c dfalib/SVerify1.c dfalib/SVerify2.c
        dfalib/VolumeBitmapCheck.c
        dfalib/uuid.c
        dfalib/hfsVersionString.c)


add_library(dfa ${SOURCES})
target_include_directories(dfa
        PUBLIC ${CMAKE_SOURCE_DIR}/lib_fsck_hfs ${CMAKE_SOURCE_DIR}/fsck_hfs
)
target_compile_definitions(dfa
        PUBLIC DEBUG_BUILD=0 XNU_KERNEL_PRIVATE)