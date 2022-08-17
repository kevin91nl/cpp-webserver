cmake_minimum_required(VERSION 3.3.0)

project(DemoServer VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(CTest)
enable_testing()

find_package(Crow)

file(GLOB_RECURSE fileCollection "source/*.cpp")
add_executable(DemoServer ${fileCollection})

# Linking
target_link_libraries(DemoServer PUBLIC Crow::Crow)