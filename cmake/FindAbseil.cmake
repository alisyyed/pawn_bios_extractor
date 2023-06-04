# Find Abseil library

find_path(ABSL_INCLUDE_DIR absl/base/casts.h)
find_library(ABSL_LIBRARY absl)

if (ABSL_INCLUDE_DIR AND ABSL_LIBRARY)
    set(ABSL_FOUND TRUE)
endif()

mark_as_advanced(ABSL_INCLUDE_DIR ABSL_LIBRARY)

if (ABSL_FOUND)
    if (NOT TARGET absl::absl)
        add_library(absl::absl UNKNOWN IMPORTED)
        set_target_properties(absl::absl PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${ABSL_INCLUDE_DIR}"
            IMPORTED_LOCATION "${ABSL_LIBRARY}"
        )
    endif()
endif()
