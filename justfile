# Configure an out-of-source build with Ninja.
configure:
    cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug

# Configure, then build all targets or a specific target.
build target="all": configure
    cmake --build build --target {{ quote(target) }}

# Format all C++ source files.
clang-format:
    fd --hidden --no-ignore --type f --extension cpp --exec-batch clang-format -i

# Format all Nix files.
nixfmt:
    fd --hidden --no-ignore --type f --extension nix --exec-batch nixfmt

# Format the justfile.
just-format:
    just --format

# Run all formatters.
format: clang-format nixfmt just-format
