#!/bin/bash
   
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

add="CMakeLists.txt"
file="$current_path/$add"

if [ -e "$file" ]; then
    echo "CMakeLists.txt exists"
    exit 9999
else 
    echo "CMakeLists.txt does not exist"
    echo "$file"   
fi  

#All fine, watch out for ~ symbol in script!  
