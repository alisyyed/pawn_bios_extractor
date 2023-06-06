cmake_minimum_required(VERSION 3.14)
project(pawn)

# Compiler options
set(CMAKE_CXX_STANDARD 17)

# Platform-specific sources and libraries
if(WIN32)
    set(PLATFORM_SOURCES pawn/chipset_windows.cc pawn/physical_memory_windows.cc)
    set(PLATFORM_LIBRARIES psapi user32)
else()
    set(PLATFORM_SOURCES pawn/chipset_linux.cc pawn/physical_memory_linux.cc)
    set(PLATFORM_LIBRARIES)
endif()

# Source files
set(SOURCES pawn/chipset.cc ${PLATFORM_SOURCES} pawn/pawn.cc pawn/pci.cc pawn/physical_memory.cc)

# Add the executable
add_executable(pawn ${SOURCES})

# Link platform-specific libraries
target_link_libraries(pawn ${PLATFORM_LIBRARIES})

add_subdirectory(pawn)
