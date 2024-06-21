
enable_language(OBJC)
enable_language(OBJCXX)

set(TARGET hfs-tests)
set(SOURCES #cases/test-raw-dev-unaligned.c cases/test-list-ids.c cases/test-journal-toggle.c cases/test-move-data-extents.c cases/test-secluded-rename.c cases/test-unicode-file-names.c
    #cases/test-uncached-io.c cases/test-thr739ottled-io.c cases/test-mod-time.c cases/test_disklevel.c cases/test-invalid-ranges.m cases/test-invalid-ranges.m cases/test-map-private.m
    #cases/test-log2phys.m cases/test-fsinfo-sig.c cases/test-key-roll.c cases/test-get-volume-create-time.c cases/test-msync-16k.c cases/test-readdir.c cases/test-lf-cs-plugin.c
    #cases/test-set-protection-class.c cases/test-scan-range-size.c cases/test-resize.m cases/test-fsinfo.c cases/test-fsinfo-cprotect.c cases/test-hard-links.m cases/test-getattrlist-dprotect.m
    #cases/test-fsync.c cases/test-file-too-big.m cases/test-renamex.c cases/test-dir-link.c cases/test-deep-rm.c cases/test-defrag.c
    #cases/test-access.c cases/test-external-jnl.c cases/test-transcode.m cases/test-quotas.c
    hfs-tests.mm disk-image.m systemx.c)

#execute_process(COMMAND gnustep-config --objc-flags OUTPUT_VARIABLE GNUSTEP_FLAGS)
add_compile_options(-fblocks)
set(GNUSTEP_FLAGS -MMD -MP -DGNUSTEP -DGNUSTEP_BASE_LIBRARY=1 -DGNU_RUNTIME=1 -DGNUSTEP_BASE_LIBRARY=1 -fno-strict-aliasing -fexceptions -fobjc-exceptions -D_NATIVE_OBJC_EXCEPTIONS -pthread -fPIC -Wall -DGSWARN -DGSDIAGNOSE -Wno-import -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fstack-clash-protection -fcf-protection -g -ffile-prefix-map=/build/gnustep-make/src=/usr/src/debug/gnustep-make -flto=auto -fconstant-string-class=NSConstantString -I. -I/home/krzysiu/GNUstep/Library/Headers -I/usr/include)

add_executable(${TARGET} ${SOURCES})
target_link_libraries(${TARGET} bsd dispatch gnustep-base objc)
target_include_directories(${TARGET} PUBLIC .)

target_compile_options(${TARGET} PUBLIC ${GNUSTEP_FLAGS})
target_link_options(${TARGET} PUBLIC ${GNUSTEP_FLAGS})
add_test(
        NAME ${TARGET}
        COMMAND ${CMAKE_BINARY_DIR}/hfs-tests
)