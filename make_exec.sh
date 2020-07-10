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
	echo "CMakeLists.txt does not exist! Create file: $file"

	echo "#Minimal OpenCL CMakeLists.txt by StreamHPC" > $file
	echo "cmake_minimum_required (VERSION 3.1)" >> $file
	echo "project($project_name)" >> $file 
	# Handle OpenCL
	echo "find_package(OpenCL REQUIRED)" >> $file 
   	echo "include_directories(${OpenCL_INCLUDE_DIRS})" >> $file 
   	echo "link_directories(${OpenCL_LIBRARY})" >> $file 
   	echo "add_executable ($exc_name main.cpp)" >> $file 
   	echo "target_include_directories ($exc_name PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})" >> $file
   	echo "target_link_libraries ($exc_name ${OpenCL_LIBRARY})" >> $file
	
fi  

cd $build_dest

cmake ..

make
 
