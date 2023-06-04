# Find Windows dependencies

# Example:
# find_path(WINDOWS_INCLUDE_DIR windows.h)
# find_library(WINDOWS_LIBRARY kernel32)

# if (WINDOWS_INCLUDE_DIR AND WINDOWS_LIBRARY)
#     set(WINDOWS_FOUND TRUE)
# endif()

# mark_as_advanced(WINDOWS_INCLUDE_DIR WINDOWS_LIBRARY)

# if (WINDOWS_FOUND)
#     if (NOT TARGET windows::windows)
#         add_library(windows::windows UNKNOWN IMPORTED)
#         set_target_properties(windows::windows PROPERTIES
#             INTERFACE_INCLUDE_DIRECTORIES "${WINDOWS_INCLUDE_DIR}"
#             IMPORTED_LOCATION "${WINDOWS_LIBRARY}"
#         )
#     endif()
# endif()
