include hfs.mk/cc.mk

BUILD_DIR ?= build
BIN_DIR ?= $(BUILD_DIR)/Release/
DBG_DIR ?= $(BUILD_DIR)/Debug/
SRC_DIR ?= ..

KERN_MOD_FLAGS := -I$(INC_DIR) -I/Users/krzysiu/HFSUtils/hfs/build/Release/include -I$(KERNEL_FRAMEWORD_DIR)/PrivateHeaders -I$(KERNEL_FRAMEWORD_DIR)/Headers
CCFLAGS += -mkernel -DKERNEL -DKERNEL_PRIVATE -DDRIVER_PRIVATE -DAPPLE -DNeXT -DKASAN\=1 -DKASAN_CLASSIC\=1 -fsanitize\=address -mllvm -asan-globals-live-support -mllvm -asan-force-dynamic-shadow $(KERN_MOD_FLAGS)
CXXFLAGS += -fapple-kext -mkernel -DKERNEL -DKERNEL_PRIVATE -DDRIVER_PRIVATE -DAPPLE -DNeXT -DKASAN\=1 -DKASAN_CLASSIC\=1 -fsanitize\=address -mllvm -asan-globals-live-support -mllvm -asan-force-dynamic-shadow $(KERN_MOD_FLAGS)

# lkm
SRCS := $(shell find $(SRC_DIR)/core -name '*.c' -or -name '*.cpp'  -or -name '*.m' -or -name '*.mm')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := -Xlinker -kext -nostdlib -lkmodc++ -lkmod -lcc_kext

$(BIN_DIR)/hfs.lo: $(OBJS)
	@echo "Building hfs kernel module"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(DEPS)


# encodings
ENCODINGS_SRCS := $(shell find $(SRC_DIR)/hfs_encodings -name '*.c' -or -name '*.cpp'  -or -name '*.m' -or -name '*.mm')
ENCODINGS_OBJS := $(ENCODINGS_SRCS:%=$(BUILD_DIR)/%.o)

$(BIN_DIR)/encodings-hfs.lo: $(ENCODINGS_OBJS)
	@echo "Building encodings-hfs kernel module"
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $(ENCODINGS_OBJS) -o $@ $(DEPS)
