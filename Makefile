# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -IDependencies/GLFW/include
LDFLAGS = -LDependencies/GLFW/lib -lglfw3 -lopengl32 -lgdi32 -luser32 -lkernel32

# Target name
TARGET = main.exe

# Source files
SRC = main.cpp
OBJ = $(SRC:.cpp=.o)

# Default build rule
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean rule
clean:
	del $(OBJ) $(TARGET) 2>nul || true

# Phony targets (not real files)
.PHONY: all clean
