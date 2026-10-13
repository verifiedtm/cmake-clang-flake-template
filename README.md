# CMake and Clang flake template

A Nix development shell with Clang, CMake, Ninja, clang-format, clang-tidy, and Just.

## Copy the template

```sh
git clone https://github.com/verifiedtm/cmake-clang-flake-template.git my-project
cd my-project
rm -rf .git
git init
git add .
git commit -m "Initialize project from CMake and Clang flake template"
```

Replace `my-project` with your project name and rename the project and executable
in `CMakeLists.txt`.

## Development

```sh
nix develop
just build          # Configure and build all targets
just build example  # Build a specific target
just configure      # Generate the build files
./build/example     # Run the example executable
```

The example uses C++20. The shell uses the default Clang version from the pinned
Nixpkgs input; set `llvm` in `flake.nix` to a versioned LLVM package set to select
another version.

CMake writes `build/compile_commands.json` for tools such as clang-tidy and clangd.
Enter `nix develop` before configuring so CMake selects Clang. If you configured
with another compiler, remove `build/` and configure again inside the shell.

Nix requires the `nix-command` and `flakes` experimental features.
