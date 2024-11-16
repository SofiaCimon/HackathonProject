# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++17 -Wall -IC:/w64devkit/include/include/raylib-5.0/src -Wno-enum-compare -Wno-unused-variable -fpermissive
LDFLAGS := -LC:/w64devkit/include/include/raylib-5.0/src -lraylib -lopengl32 -lgdi32 -lwinmm

SRCS := $(wildcard *.cpp)
OBJS := $(SRCS:.cpp=.o)
BIN := ParticleFluid_Simulator

.PHONY: all clean run

all: $(BIN) run

$(BIN): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run:
	./$(BIN)

clean:
	rm -f $(OBJS) $(BIN)

