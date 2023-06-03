cmake_minimum_required(VERSION 3.14)
project(pawn_bios_extractor VERSION 1.0)

set(CMAKE_CXX_STANDARD 14)

# Add your source files here
set(SOURCES 
    src/main.cpp
    src/helper.cpp
    # Add more source files as needed
)

# Add your header files here
set(HEADERS
    include/helper.h
    # Add more header files as needed
)

# Generate the executable
add_executable(pawn_bios_extractor ${SOURCES} ${HEADERS})

# Add any additional libraries or dependencies here
target_link_libraries(pawn_bios_extractor 
    # Add your libraries here
)

# Set the output directory for the executable
set_target_properties(pawn_bios_extractor PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# Install the executable
install(TARGETS pawn_bios_extractor DESTINATION bin)
