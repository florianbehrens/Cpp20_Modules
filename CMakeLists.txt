cmake_minimum_required(VERSION 3.25 FATAL_ERROR)
project(c++20_modules)

# Activate experimental C++20 Modules support in CMake,
# taken from: https://github.com/Kitware/CMake/blob/master/Help/dev/experimental.rst
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
#string(CONCAT CMAKE_EXPERIMENTAL_CXX_SCANDEP_SOURCE
#    "<CMAKE_CXX_COMPILER> <DEFINES> <INCLUDES> <FLAGS> <SOURCE>"
#    " -MT <DYNDEP_FILE> -MD -MF <DEP_FILE>"
#    " ${flags_to_scan_deps} -fdep-file=<DYNDEP_FILE> -fdep-output=<OBJECT>"
#)
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FORMAT "gcc")
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FLAG
#  "${compiler_flags_for_module_map} -fmodule-mapper=<MODULE_MAP_FILE>")
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "2182bf5c-ef0d-489a-91da-49dbc3090d2a")

####

#set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
#string(CONCAT CMAKE_EXPERIMENTAL_CXX_SCANDEP_SOURCE
#  "${CMAKE_CXX_COMPILER_CLANG_SCAN_DEPS}"
#  " -format=p1689 --p1689-targeted-file-name=<SOURCE> --p1689-targeted-output=<OBJECT> "
#  " --p1689-makeformat-output=<DEP_FILE>"
#  " --"
#  " <DEFINES> <INCLUDES> <FLAGS> -x c++ <SOURCE>"
#  " -MT <DYNDEP_FILE> -MD"
#  " > <DYNDEP_FILE>")
#
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "2182bf5c-ef0d-489a-91da-49dbc3090d2a")
#
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FORMAT "clang")
#set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FLAG "@<MODULE_MAP_FILE>")

set(CMake_TEST_CXXModules_UUID "a246741c-d067-4019-a8fb-3d16b0c9d1d3")

set(CMAKE_EXPERIMENTAL_CXX_MODULE_DYNDEP 1)
string(CONCAT CMAKE_EXPERIMENTAL_CXX_SCANDEP_SOURCE
  "<CMAKE_CXX_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E -x c++ <SOURCE>"
  " -MT <DYNDEP_FILE> -MD -MF <DEP_FILE>"
  " -fmodules-ts -fdep-file=<DYNDEP_FILE> -fdep-output=<OBJECT> -fdep-format=p1689r5"
  " -o <PREPROCESSED_SOURCE>")

set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "3c375311-a3c9-4396-a187-3227ef642046")
set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FORMAT "gcc")
set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FLAG "-fmodules-ts -fmodule-mapper=<MODULE_MAP_FILE> -fdep-format=p1689r5 -x c++")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Default to C++ extensions being off. Clang's modules support have trouble
# with extensions right now.
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(c++20_modules)

target_sources(
    c++20_modules
    PRIVATE
        translation_unit.cpp
        mymodule_unit.cpp
    PRIVATE FILE_SET CXX_MODULES FILES
        mymodule_interface_unit.cpp
        mymodule_interface_partition.cpp
        mymodule_partition.cpp
)
