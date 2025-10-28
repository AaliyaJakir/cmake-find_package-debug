# Minimal Qt6Config imitation that fails when Quick (and friends) are missing
set(Qt6_VERSION 6.5.0)

# Paths: CMAKE_CURRENT_LIST_DIR == .../lib/cmake/Qt6
get_filename_component(_qt_cmake_root "${CMAKE_CURRENT_LIST_DIR}" DIRECTORY) # .../lib/cmake

# Components your gz-gui asks for
set(_req Quick QuickControls2 Widgets Test)

set(Qt6_FOUND TRUE)
set(_missing "")
foreach(_c IN LISTS _req)
  set(_config_path "${_qt_cmake_root}/Qt6${_c}/Qt6${_c}Config.cmake")
  if(NOT EXISTS "${_config_path}")
    set(Qt6_FOUND FALSE)
    list(APPEND _missing "${_c}")
  endif()
endforeach()

if(NOT Qt6_FOUND)
  # Craft the same style reason message Qt uses
  if(_missing)
    list(GET _missing 0 _first_missing)
    set(_expected_path "${_qt_cmake_root}/Qt6${_first_missing}/Qt6${_first_missing}Config.cmake")
    set(Qt6_NOT_FOUND_MESSAGE
      "Failed to find required Qt component \"${_first_missing}\".\n\nExpected Config file at\n  \"${_expected_path}\"\nDOES NOT exist")
  else()
    set(Qt6_NOT_FOUND_MESSAGE "Required Qt components missing.")
  endif()
endif()
