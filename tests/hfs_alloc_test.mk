include hfs.mk/cc.mk

BUILD_DIR ?= build
BIN_DIR ?= $(BUILD_DIR)/Release/
SRC_DIR ?= ..

SRCS := $(SRC_DIR)/tests/hfs_alloc_test.c
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

$(BIN_DIR)/hfs_alloc_test: $(OBJS)
	@echo "Building hfs_alloc_test"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJS) -o $@