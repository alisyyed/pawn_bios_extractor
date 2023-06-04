# Find Gflags library

find_path(GFLAGS_INCLUDE_DIR gflags/gflags.h)
find_library(GFLAGS_LIBRARY gflags)

if (GFLAGS_INCLUDE_DIR AND GFLAGS_LIBRARY)
    set(GFLAGS_FOUND TRUE)
endif()

mark_as_advanced(GFLAGS_INCLUDE_DIR GFLAGS_LIBRARY)

if (GFLAGS_FOUND)
    if (NOT TARGET gflags::gflags)
        add_library(gflags::gflags UNKNOWN IMPORTED)
        set_target_properties(gflags::gflags PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${GFLAGS_INCLUDE_DIR}"
            IMPORTED_LOCATION "${GFLAGS_LIBRARY}"
        )
    endif()
endif()
