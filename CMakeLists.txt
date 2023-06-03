cmake_minimum_required(VERSION 3.14)
project(pawn_bios_extractor VERSION 1.0)

# Set C++ standard to C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add compiler flags for optimization and warning levels
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    add_compile_options(-Wall -Wextra -Wpedantic -O3)
endif()

# Find and include external dependencies, if any
find_package(Boost REQUIRED COMPONENTS filesystem)

# Define source files using globbing for automatic detection
file(GLOB_RECURSE SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp"
)

# Create the executable target
add_executable(pawn_bios_extractor ${SOURCES})

# Set include directories
target_include_directories(pawn_bios_extractor PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Link external libraries, if any
target_link_libraries(pawn_bios_extractor PRIVATE
    Boost::filesystem
)

# Set the output directory for the built executable
set_target_properties(pawn_bios_extractor PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin"
)

# Optionally, enable unit tests using Google Test
option(BUILD_TESTS "Build unit tests" ON)
if (BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

# Optionally, install the built executable and related files
option(BUILD_INSTALL "Install the built files" ON)
if (BUILD_INSTALL)
    install(TARGETS pawn_bios_extractor DESTINATION bin)
    install(DIRECTORY data DESTINATION share/pawn_bios_extractor)
endif()

# Configure CMake to generate compile_commands.json for IDE integration
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Enable advanced features for insanity level of epicness
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(pawn_bios_extractor PRIVATE -march=native -fopenmp)
    target_link_libraries(pawn_bios_extractor PRIVATE -fopenmp)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(pawn_bios_extractor PRIVATE -march=native -fopenmp)
    target_link_libraries(pawn_bios_extractor PRIVATE -fopenmp)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_options(pawn_bios_extractor PRIVATE /arch:AVX2 /openmp)
endif()

# Raise the insanity level with advanced optimizations
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_options(pawn_bios_extractor PRIVATE -Ofast)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(pawn_bios_extractor PRIVATE -Ofast)
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_options(pawn_bios_extractor PRIVATE /O2)
endif()
