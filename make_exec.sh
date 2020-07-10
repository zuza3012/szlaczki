#!/bin/bash

project_name=$1
exc_name=$2

current_path=$PWD
build_dest="$current_path/build"
if [ ! -d $build_dest ]; then
	mkdir -p $build_dest
	echo "Build folder created"
else
	echo "Build folder already exists." 
fi

add="/CMakeLists.txt"
file="$current_path$add"

if [ -e "$file" ]; then
	echo "CMakeLists.txt exists"
else 
	echo "CMakeLists.txt does not exist"
	touch $file
     	
	echo "    #Minimal OpenCL CMakeLists.txt by StreamHPC

   	 cmake_minimum_required (VERSION 3.1)

   	 project($project_name)

   	 # Handle OpenCL
   	 find_package(OpenCL REQUIRED)
   	 include_directories(${OpenCL_INCLUDE_DIRS})
   	 link_directories(${OpenCL_LIBRARY})

   	 add_executable ($exc_name main.cpp)
   	 target_include_directories (main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
   	 target_link_libraries (main ${OpenCL_LIBRARY})" > $file
	
fi  

cd $build_dest

cmake ..

make
 
