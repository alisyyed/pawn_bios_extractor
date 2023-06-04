# Find Glog library

find_path(GLOG_INCLUDE_DIR glog/logging.h)
find_library(GLOG_LIBRARY glog)

if (GLOG_INCLUDE_DIR AND GLOG_LIBRARY)
    set(GLOG_FOUND TRUE)
endif()

mark_as_advanced(GLOG_INCLUDE_DIR GLOG_LIBRARY)

if (GLOG_FOUND)
    if (NOT TARGET glog::glog)
        add_library(glog::glog UNKNOWN IMPORTED)
        set_target_properties(glog::glog PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${GLOG_INCLUDE_DIR}"
            IMPORTED_LOCATION "${GLOG_LIBRARY}"
        )
    endif()
endif()
