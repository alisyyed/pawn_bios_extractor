# Revised version of Makefile

# Compiler and flags
CC := g++
CFLAGS := -std=c++17

# Platform-specific sources and libraries
ifeq ($(OS),Windows_NT)
	PLATFORM_SOURCES := chipset_windows.cc physical_memory_windows.cc
	PLATFORM_LIBRARIES := -lpsapi -luser32
else
	PLATFORM_SOURCES := chipset_linux.cc physical_memory_linux.cc
	PLATFORM_LIBRARIES :=
endif

# Source files
SOURCES := chipset.cc $(PLATFORM_SOURCES) pawn.cc pci.cc physical_memory.cc

# Target executable
TARGET := pawn

all: $(TARGET)

$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGET) $(PLATFORM_LIBRARIES)

clean:
	rm -f $(TARGET)
