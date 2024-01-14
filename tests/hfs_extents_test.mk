include hfs.mk/cc.mk

BUILD_DIR ?= build/
BIN_DIR ?= $(BUILD_DIR)/Release/
SRC_DIR ?= ../

SRCS := $(SRC_DIR)/tests/hfs_extents_test.c $(SRC_DIR)/core/hfs_extents.c
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

CCFLAGS += -DFS_BUNDLE_BIN_PATH\=\"/System/Library/Filesystems/hfs.fs/Contents/Resources\" -DHFS_EXTENTS_TEST
CXXFLAGS += -DFS_BUNDLE_BIN_PATH\=\"/System/Library/Filesystems/hfs.fs/Contents/Resources\" -DHFS_EXTENTS_TEST

$(BIN_DIR)/hfs_extents_test: $(OBJS)
	@echo "Building hfs_extents_test"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJS) -o $@