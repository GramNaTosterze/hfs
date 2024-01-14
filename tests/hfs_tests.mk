include hfs.mk/cc.mk

BUILD_DIR ?= build
BIN_DIR ?= $(BUILD_DIR)/Release/
SRC_DIR ?= ..
INC_DIR := $(SRC_DIR)/tests/

SRCS := $(shell find $(SRC_DIR)/tests/cases -name '*.c' -or -name '*.cpp' -or -name '*.m' -or -name '*.mm') # remove others
SRCS += $(SRC_DIR)/tests/disk-image.m $(SRC_DIR)/tests/hfs-tests.mm $(SRC_DIR)/tests/systemx.c
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
LDFLAGS := -stdlib\=libc++ -fobjc-arc -fobjc-link-runtime -framework IOKit -lz

CCFLAGS += -I$(INC_DIR)
CXXFLAGS += -I$(INC_DIR)

$(BIN_DIR)/hfs-tests: $(OBJS)
	@echo "Building hfs-tests"
	@mkdir -p $(BIN_DIR)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@

.PHONY: run_all
run_all: $(BIN_DIR)/hfs-tests 
	$(eval TESTS := $(shell $(BIN_DIR)/hfs-tests list))
	@$(foreach test, $(TESTS), sudo $(BIN_DIR)/hfs-tests --test $(test) run;)
	