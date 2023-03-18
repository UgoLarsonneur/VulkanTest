CC = g++

# Flags
CFLAGS = -std=c++17 -O2
DEBUG_FLAGS = -g
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

# Directories
SRC_DIR = src
INC_DIR = inc
OBJ_DIR = obj
BIN_DIR = bin
SHADER_DIR = shaders
SHADER_OBJ_DIR = shaders


# Find all the C++ files in the source directory
SRCS := $(shell find $(SRC_DIR) -name '*.cpp')

# Convert the C++ files to object files in the object directory
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

# The final binary file
TARGET = $(BIN_DIR)/VulkanTest

# Compile the program
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

# Compile the object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@


#debug
#TODO faire mieux
debug: CXXFLAGS += -g
debug: TARGET = $(BIN_DIR)/DebugVulkanTest
debug: $(TARGET)


#shaders
#TODO
	

# Clean the object and binary files
clean:
	rm -f $(OBJ_DIR)/*.o $(BIN_DIR)/*

test: $(TARGET)
	$(TARGET) 

.PHONY: test clean debug shaders
