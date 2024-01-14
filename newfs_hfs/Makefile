include hfs.mk/cc.mk

BUILD_DIR ?= build
BIN_DIR ?= $(BUILD_DIR)/Release/
SRC_DIR ?= ..

SRCS := $(shell find $(SRC_DIR)/newfs_hfs -name '*.c' -or -name '*.cpp'  -or -name '*.m' -or -name '*.mm')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := -framework CoreFoundation -framework IOKit -lutil

# Target rules for newfs_hfs
$(BIN_DIR)/newfs_hfs: $(OBJS)
	@echo "Building newfs_hfs"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(DEPS)
	@echo "Success"
