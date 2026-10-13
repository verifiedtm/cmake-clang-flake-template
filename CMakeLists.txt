cmake_minimum_required(VERSION 3.20)

project(example VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(example app/main.cpp)
target_compile_features(example PRIVATE cxx_std_20)
set_target_properties(example PROPERTIES CXX_EXTENSIONS OFF)
target_compile_options(example PRIVATE
    $<$<CXX_COMPILER_ID:Clang,AppleClang,GNU>:-Wall;-Wextra;-Wpedantic>
)
