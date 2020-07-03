#Minimal OpenCL CMakeLists.txt by StreamHPC
cmake_minimum_required (VERSION 3.1)
project(OpenCL_1)

set(CMAKE_CXX_FLAGS "-std=c++0x")

# Handle OpenCL
find_package(OpenCL REQUIRED)
include_directories(${OpenCL_INCLUDE_DIRS})
link_directories(${OpenCL_LIBRARY})

add_executable (main main.cpp)
target_include_directories (main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries (main ${OpenCL_LIBRARY})
