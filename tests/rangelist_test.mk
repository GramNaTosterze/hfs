include hfs.mk/cc.mk

BUILD_DIR ?= build
BIN_DIR ?= $(BUILD_DIR)/Release/
DBG_DIR ?= $(BUILD_DIR)/Debug/
SRC_DIR ?= .

SRCS := ./tests/rangelist_test.c
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

$(BIN_DIR)/rangelist_test: $(OBJS)
	@echo "Building hfs-tests"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJS) -o $@