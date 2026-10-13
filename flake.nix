{
  description = "A CMake and Clang development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        llvm = pkgs.llvmPackages;
      in
      {
        devShells.default = pkgs.mkShell.override { stdenv = llvm.stdenv; } {
          packages = [
            # C and C++ tools
            pkgs.cmake
            pkgs.ninja
            llvm.clang-tools

            # other tools
            pkgs.just
            pkgs.fd
          ];
        };
      }
    );
}
