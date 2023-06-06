cmake_minimum_required(VERSION 3.14)
project(pawn)

# Compiler options
set(CMAKE_CXX_STANDARD 17)

# Include vcpkg toolchain file
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")

# Include the subdirectory containing the other CMakeLists.txt.
add_subdirectory(pawn)
add_subdirectory(cmake/absl) # Add this line to include the Abseil library
