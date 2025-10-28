cmake_minimum_required(VERSION 3.22)
project(Qt6Find_Test)

# Verbose package search logging
set(CMAKE_FIND_DEBUG_MODE ON)

# Reproduce the failure first:
#  - qtbase has Qt6Config.cmake but no Quick component
#  - qtdeclarative has Quick and QuickControls2 component configs
# This order makes CMake anchor on qtbase and then fail to find Quick there.
set(CMAKE_PREFIX_PATH
  "${CMAKE_SOURCE_DIR}/qt_fake/qtbase"
  "${CMAKE_SOURCE_DIR}/qt_fake/qtdeclarative"
)

message(STATUS "CMAKE_PREFIX_PATH = ${CMAKE_PREFIX_PATH}")

# Use the same component list gz-gui asks for
find_package(Qt6 REQUIRED COMPONENTS Core Quick QuickControls2 Widgets Test)

# If it ever succeeds, print where it came from
message(STATUS "Qt6_VERSION = ${Qt6_VERSION}")
message(STATUS "Qt6Quick_DIR = ${Qt6Quick_DIR}")
message(STATUS "Qt6QuickControls2_DIR = ${Qt6QuickControls2_DIR}")
message(STATUS "Qt6Widgets_DIR = ${Qt6Widgets_DIR}")
message(STATUS "Qt6Test_DIR = ${Qt6Test_DIR}")

