# Revised version of CMakeLists.txt

cmake_minimum_required(VERSION 3.14)
project(pawn)

# Compiler options
set(CMAKE_CXX_STANDARD 17)

# Platform-specific sources and libraries
if(WIN32)
    set(PLATFORM_SOURCES chipset_windows.cc physical_memory_windows.cc)
    set(PLATFORM_LIBRARIES psapi user32)
else()
    set(PLATFORM_SOURCES chipset_linux.cc physical_memory_linux.cc)
    set(PLATFORM_LIBRARIES)
endif()

# Source files
set(SOURCES chipset.cc ${PLATFORM_SOURCES} pawn.cc pci.cc physical_memory.cc)

# Add the executable
add_executable(pawn ${SOURCES})

# Link platform-specific libraries
target_link_libraries(pawn ${PLATFORM_LIBRARIES})
