
# C files
$(BUILD_DIR)/%.c.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CCFLAGS) -c $< -o $@

# C++ files
$(BUILD_DIR)/%.cpp.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Objective-C files
$(BUILD_DIR)/%.m.o: %.m
	@mkdir -p $(dir $@)
	$(CXX) $(CCFLAGS) -c $< -o $@

# Objective-C++ files
$(BUILD_DIR)/%.mm.o: %.mm
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@