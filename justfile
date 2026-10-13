# Configure an out-of-source build with Ninja.
configure:
    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug

# Configure, then build all targets or a specific target.
build target="all": configure
    cmake --build build --target {{quote(target)}}
