cmake_minimum_required(VERSION 3.10)

# Project name and language
project(OpenGL_GLFW_Project LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add your source files
add_executable(main
    main.cpp
)

# Include GLFW headers
target_include_directories(main PRIVATE
    ${CMAKE_SOURCE_DIR}/Dependencies/GLFW/include
)

# Link directories (where libglfw3.a is located)
link_directories(${CMAKE_SOURCE_DIR}/Dependencies/GLFW/lib)

# Link libraries
target_link_libraries(main
    glfw3
    opengl32
    gdi32
    user32
    kernel32
)

# Optional: for MinGW, ensure static linking of libstdc++ and libgcc
if(MINGW)
    target_link_options(main PRIVATE -static-libgcc -static-libstdc++)
endif()
