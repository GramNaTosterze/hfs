# MakeFile for building hfs tools on Linux
CC = gcc
CXX = g++

BUILD_DIR := build
BIN_DIR := $(BUILD_DIR)/Release
DBG_DIR := $(BUILD_DIR)/Debug
SRC_DIR := .
INC_DIR := .  #TODO

CCFLAGS := -c -std=gnu99 -ffreestanding -Wall -Wextra -I$(INC_DIR)
CXXFLAGS := -c -std=c++17 -ffreestanding -Wall -Wextra -I$(INC_DIR) # CHECK WHAT STD XCODE USES!!

## Target Variables
#=============================
# newfs_hfs
NEWFS_HFS_SRCS := $(shell find $(SRC_DIR)/newfs_hfs -name '*.c' -or -name '*.c++')
NEWFS_HFS_OBJS := $(NEWFS_HFS_SRCS:%=$(BUILD_DIR)/%.o)
NEWFS_HFS_DEPS := -framework CoreFoundation -framework IOKit -lutil
# mount_hfs
MOUNT_HFS_SRCS := $(shell find $(SRC_DIR)/mount_hfs -name '*.c' -or -name '*.c++')
MOUNT_HFS_OBJS := $(MOUNT_HFS_SRCS:%=$(BUILD_DIR)/%.o)
MOUNT_HFS_DEPS := -framework CoreFoundation -framework IOKit -lutil
# CopyHFSMeta
COPYHFSMETA_SRCS := $(shell find $(SRC_DIR)/CopyHFSMeta -name '*.c' -or -name '*.c++')
COPYHFSMETA_OBJS := $(COPYHFSMETA_SRCS:%=$(BUILD_DIR)/%.o)
COPYHFSMETA_DEPS := -framework CoreFoundation -lz
# hfs.util
HFS_UTIL_SRCS := $(shell find $(SRC_DIR)/hfs_util -name '*.c' -or -name '*.c++')
HFS_UTIL_OBJS := $(HFS_UTIL_SRCS:%=$(BUILD_DIR)/%.o)
HFS_UTIL_DEPS := -framework CoreFoundation
# fsck_hfs
FSCK_HFS_SRCS := $(shell find $(SRC_DIR)/fsck_hfs -name '*.c' -or -name '*.c++') 
FSCK_HFS_SRCS += $(shell find $(SRC_DIR)/lib_fsck_hfs -name '*.c' -or -name '*.c++')
FSCK_HFS_OBJS := $(FSCK_HFS_SRCS:%=$(BUILD_DIR)/%.o)
FSCK_HFS_DEPS := -framework CoreFoundation -framework IOKit


## Generic rules
#=============================
all: newfs_hfs mount_hfs
.PHONY: all debug

# C files
$(BUILD_DIR)/%.c.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) $< -o $@

# C++ files
$(BUILD_DIR)/%.cpp.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $< -o $@

debug: CCFLAGS += -DDEBUG -g
debug: CXXFLAGS += -DDEBUG -g

## hfs.fs
#=============================
# Meta package
hfs.fs: newfs_hfs CopyHFSMeta hfs.util mount_hfs fsck_hfs
#hfs.fs: #INSTALL THEM

## newfs_hfs
#=============================
# Target rules for newfs_hfs
.PHONY: newfs_hfs
newfs_hfs: $(BIN_DIR)/newfs_hfs

$(BIN_DIR)/newfs_hfs: $(NEWFS_HFS_OBJS)
	@echo "Building newfs_hfs"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(NEWFS_HFS_OBJS) -o $@ $(NEWFS_HFS_DEPS)

# Target rules for newfs_hfs_debug
.PHONY: newfs_hfs_debug
newfs_hfs_debug: debug
newfs_hfs_debug: $(DBG_DIR)/newfs_hfs

$(DBG_DIR)/newfs_hfs: $(NEWFS_HFS_OBJS)
	@echo "Building newfs_hfs_debug"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(NEWFS_HFS_OBJS) -o $@ $(NEWFS_HFS_DEPS)

## mount_hfs
#=============================
# Target rules for mount_hfs
.PHONY: mount_hfs
mount_hfs: $(BIN_DIR)/mount_hfs

$(BIN_DIR)/mount_hfs: $(MOUNT_HFS_OBJS)
	@echo "Building mount_hfs"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(MOUNT_HFS_OBJS) -o $@ $(MOUNT_HFS_DEPS)

# Target rules for mount_hfs_debug
.PHONY: mount_hfs_debug
mount_hfs_debug: debug
mount_hfs_debug: $(BIN_DIR)/mount_hfs_debug

$(BIN_DIR)/mount_hfs_debug: $(MOUNT_HFS_OBJS)
	@echo "Building mount_hfs"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(MOUNT_HFS_OBJS) -o $@ $(MOUNT_HFS_DEPS)

## CopyHFSMeta
#=============================
CopyHFSMeta: $(BIN_DIR)/CopyHFSMeta

$(BIN_DIR)/CopyHFSMeta: $(COPYHFSMETA_OBJS)
	@echo "Building CopyHFSMeta"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(COPYHFSMETA_OBJS) -o $@ $(COPYHFSMETA_DEPS)

## hfs.util
#=============================
hfs.util: $(BIN_DIR)/hfs.util

$(BIN_DIR)/hfs.util: $(HFS_UTIL_OBJS)
	@echo "Building CopyHFSMeta"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(HFS_UTIL_OBJS) -o $@ $(HFS_UTIL_DEPS)

## fsck_hfs
#=============================
fsck_hfs: $(BIN_DIR)/fsck_hfs

$(BIN_DIR)/fsck_hfs: $(FSCK_HFS_OBJS)
	@echo "Building CopyHFSMeta"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(FSCK_HFS_OBJS) -o $@ $(FSCK_HFS_DEPS)

## tests
#=============================
all-tests: hfs-tests hfs_alloc_test hfs_extents_test rangelist_test

hfs-tests: #TODO
hfs_alloc_test: #TODO
hfs_extents_test: #TODO
rangelist_test: #TODO


#=============================
.PHONY: clean help install
help:
	@echo "Available targets:"
	@echo "newfs_hfs"
	@echo "newfs_hfs_debug"
	@echo "mount_hfs"
	@echo "mount_hfs_debug"
	@echo "CopyHFSMeta"
	@echo "hfs.util"
	@echo "fsck_hfs"
	@echo "install - TODO"

clean:
	@echo "Removing build directory..."
	@rm -rf $(BUILD_DIR)

install:
	#TODO