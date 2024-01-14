# MakeFile for building hfs tools on Linux
export

CC = gcc
CXX = g++
MAKE = make

BUILD_DIR := build
BIN_DIR := $(BUILD_DIR)/Release
DBG_DIR := $(BUILD_DIR)/Debug
SRC_DIR := .
INC_DIR := .
KERNEL_FRAMEWORD_DIR := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.2.sdk/System/Library/Frameworks/Kernel.framework

## Compiler flags Flags
XCODE_USR := Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
PRIV_FRAMEWORKS := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.2.sdk/System/Library/PrivateFrameworks
SDK_ROOT := /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX14.2.sdk

CCFLAGS  := -fmessage-length\=138 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit\=0 -fcolor-diagnostics -std\=gnu99 -stdlib\=libc -fobjc-arc -Wno-trigraphs -fpascal-strings -Os -fno-common -Wno-missing-field-initializers -Wno-missing-prototypes -Werror\=return-type -Wunreachable-code -Wno-implicit-atomic-properties -Werror\=deprecated-objc-isa-usage -Wno-objc-interface-ivars -Werror\=objc-root-class -Wno-arc-repeated-use-of-weak -Wno-non-virtual-dtor -Wno-overloaded-virtual -Wno-exit-time-destructors -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wconditional-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wno-float-conversion -Wno-non-literal-null-conversion -Wno-objc-literal-conversion -Wshorten-64-to-32 -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -Wno-c++11-extensions -Wno-implicit-fallthrough -DFS_BUNDLE_BIN_PATH\=\"/System/Library/Filesystems/hfs.fs/Contents/Resources\" -DNS_BLOCK_ASSERTIONS\=1 -DOBJC_OLD_DISPATCH_PROTOTYPES\=0 -isysroot $(SDK_ROOT) -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -Winvalid-offsetof -g -fvisibility\=hidden -fvisibility-inlines-hidden -Wno-sign-conversion -Wno-infinite-recursion -Wno-move -Wno-comma -Wno-block-capture-autoreleasing -Wno-strict-prototypes -Wno-range-loop-analysis -Wno-semicolon-before-method-body -I$(BUILD_DIR)/Release/include -Wall -W -Wno-missing-field-initializers -Winteger-overflow -F$(BUILD_DIR)/Release -F$(PRIV_FRAMEWORKS)
CXXFLAGS := -fmessage-length\=138 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit\=0 -fcolor-diagnostics -std\=gnu++14 -stdlib\=libc++ -fobjc-arc -Wno-trigraphs -fpascal-strings -Os -fno-common -Wno-missing-field-initializers -Wno-missing-prototypes -Werror\=return-type -Wunreachable-code -Wno-implicit-atomic-properties -Werror\=deprecated-objc-isa-usage -Wno-objc-interface-ivars -Werror\=objc-root-class -Wno-arc-repeated-use-of-weak -Wno-non-virtual-dtor -Wno-overloaded-virtual -Wno-exit-time-destructors -Wduplicate-method-match -Wno-missing-braces -Wparentheses -Wswitch -Wunused-function -Wno-unused-label -Wno-unused-parameter -Wunused-variable -Wunused-value -Wempty-body -Wuninitialized -Wconditional-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wconstant-conversion -Wint-conversion -Wbool-conversion -Wenum-conversion -Wno-float-conversion -Wno-non-literal-null-conversion -Wno-objc-literal-conversion -Wshorten-64-to-32 -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wundeclared-selector -Wno-deprecated-implementations -Wno-c++11-extensions -Wno-implicit-fallthrough -DFS_BUNDLE_BIN_PATH\=\"/System/Library/Filesystems/hfs.fs/Contents/Resources\" -DNS_BLOCK_ASSERTIONS\=1 -DOBJC_OLD_DISPATCH_PROTOTYPES\=0 -isysroot $(SDK_ROOT) -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -Winvalid-offsetof -g -fvisibility\=hidden -fvisibility-inlines-hidden -Wno-sign-conversion -Wno-infinite-recursion -Wno-move -Wno-comma -Wno-block-capture-autoreleasing -Wno-strict-prototypes -Wno-range-loop-analysis -Wno-semicolon-before-method-body -I$(BUILD_DIR)/Release/include -Wall -W -Wno-missing-field-initializers -Winteger-overflow -F$(BUILD_DIR)/Release -F$(PRIV_FRAMEWORKS)

CCFLAGS  += -I$(XCODE_USR) -I$(INC_DIR)
CXXFLAGS += -I$(XCODE_USR) -I$(INC_DIR)
# Dbg flags
CCFLAGS_DBG  := CCFLAGS += -DDEBUG -g
CXXFLAGS_DBG := CXXFLAGS += -DDEBUG -g



## Generic rules
#=============================
all: newfs_hfs mount_hfs
.PHONY: all


## lkm - Loadable kernel module
#=============================
.PHONY: hfs-core lkm encodings-lkm
hfs-core: lkm encodings-lkm # Meta target
#hfs-core: #INSTALL

lkm:
	@$(MAKE) -f core/Makefile $(BIN_DIR)/hfs.lo

encodings-lkm:
	@$(MAKE) -f core/Makefile $(BIN_DIR)/encodings-hfs.lo


## hfs.fs
#=============================
# Meta target
hfs.fs: newfs_hfs CopyHFSMeta hfs.util mount_hfs fsck_hfs
#hfs.fs: #INSTALL

## newfs_hfs
#=============================
.PHONY: newfs_hfs newfs_hfs_debug
newfs_hfs: 
	@$(MAKE) -f newfs_hfs/Makefile $(BIN_DIR)/newfs_hfs

newfs_hfs_debug: CCFLAGS += $(CCFLAGS_DBG)
newfs_hfs_debug: CXXFLAGS += $(CXXFLAGS_DBG)
newfs_hfs_debug: BIN_DIR := $(DBG_DIR)
newfs_hfs_debug:
	@$(MAKE) -f newfs_hfs/Makefile $(BIN_DIR)/newfs_hfs

## mount_hfs
#=============================
.PHONY: mount_hfs
mount_hfs: 
	@$(MAKE) -f mount_hfs/Makefile $(BIN_DIR)/mount_hfs

mount_hfs_debug: CCFLAGS += $(CCFLAGS_DBG)
mount_hfs_debug: CXXFLAGS += $(CXXFLAGS_DBG)
mount_hfs_debug: BIN_DIR := $(DBG_DIR)
mount_hfs_debug:
	@$(MAKE) -f mount_hfs/Makefile $(BIN_DIR)/mount_hfs

## tests
#=============================
.PHONY: run-tests
run-tests: hfs-tests hfs_alloc_test hfs_extents_test rangelist_test
	@echo "Running tests"
	@$(BIN_DIR)/rangelist_test
	@$(BIN_DIR)/hfs_extents_test
	@$(BIN_DIR)/hfs_alloc_test
	@$(MAKE) -f tests/hfs_tests.mk run_all


hfs-tests: 
	@$(MAKE) -f tests/hfs_tests.mk $(BIN_DIR)/hfs-tests

hfs_alloc_test:
	@$(MAKE) -f tests/hfs_alloc_test.mk $(BIN_DIR)/hfs_alloc_test

hfs_extents_test: 
	@$(MAKE) -f tests/hfs_extents_test.mk $(BIN_DIR)/hfs_extents_test

rangelist_test:
	@$(MAKE) -f tests/rangelist_test.mk $(BIN_DIR)/rangelist_test
	


#=============================
.PHONY: clean help install
help:
	@echo "Available targets:"
	@echo "hfs.fs - meta package"
	@echo "newfs_hfs"
	@echo "newfs_hfs_debug"
	@echo "mount_hfs"
	@echo "mount_hfs_debug"
	@echo "run-tests - TODO"
	@echo "install - TODO installs currently compiled targets"

clean:
	@echo "Removing build directory..."
	@rm -rf $(BUILD_DIR)

install:
	#TODO