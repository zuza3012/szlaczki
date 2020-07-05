#!/bin/bash


get_data () {
  project_name=$1
  echo "$project_name"
}

my_function () {
  local func_result="some result"
  echo "$func_result"
}

project_name="project"

func_result="$(my_function)"
echo $func_result

echo "$project_name"
get_data 1
echo "$project_name"

current_path=$PWD
build_dest="$current_path/build"
if [ ! -d $build_dest ]; then
	mkdir -p $build_dest
	echo "$current_path"
	echo "Build folder created"
else
	echo "Build folder already exists." 
	exit 9999 # die with error code 9999
fi

add="/CMakeLists.txt"
file="$current_path$add"

if [ -e "$file" ]; then
	echo "CMakeLists.txt exists"
	exit 9999
else 
	echo "CMakeLists.txt does not exist"
	touch $file
	echo "$file"   
fi  



echo "    #Minimal OpenCL CMakeLists.txt by StreamHPC

    cmake_minimum_required (VERSION 3.1)

    project($project_name)

    # Handle OpenCL
    find_package(OpenCL REQUIRED)
    include_directories(${OpenCL_INCLUDE_DIRS})
    link_directories(${OpenCL_LIBRARY})

    add_executable (main main.cpp)
    target_include_directories (main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
    target_link_libraries (main ${OpenCL_LIBRARY})" >> $file


#All fine, watch out for ~ symbol in script!  
