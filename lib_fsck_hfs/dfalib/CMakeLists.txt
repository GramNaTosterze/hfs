set(SOURCES BlockCache.c BTree.c BTreeAllocate.c BTreeMiscOps.c BTreeScanner.c BTreeTreeOps.c
        CatalogCheck.c DecompData.h DecompMakeData.c
        dirhardlink.c HardLinkCheck.c hfs_endian.c SAllocate.c SBTree.c
        SCatalog.c SControl.c SDevice.c SExtents.c SKeyCompare.c SRebuildBTree.c SRepair.c SStubs.c SUtils.c SVerify1.c SVerify2.c
        uuid.c VolumeBitmapCheck.c)


add_library(dfalib ${SOURCES})
target_include_directories(dfalib
    PUBLIC ${CMAKE_SOURCE_DIR}/lib_fsck_hfs ${CMAKE_SOURCE_DIR}/fsck_hfs
)
