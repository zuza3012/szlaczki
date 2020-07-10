    #Minimal OpenCL CMakeLists.txt by StreamHPC

   	 cmake_minimum_required (VERSION 3.1)

   	 project(kupa)

   	 # Handle OpenCL
   	 find_package(OpenCL REQUIRED)
   	 include_directories()
   	 link_directories()

   	 add_executable (gufno main.cpp)
   	 target_include_directories (main PUBLIC )
   	 target_link_libraries (main )
