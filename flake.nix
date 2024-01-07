{
  description = "A simple example to reproduce a GHC calling convention bug.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      ghcShellFor = ghc: ghc.shellFor {
        packages = p: [ ];
        nativeBuildInputs = [ ghc.cabal-install ];
      };
    in {
      packages.x86_64-linux = {
        ghc948 = ghcShellFor pkgs.haskell.packages.ghc948;
        ghc902 = ghcShellFor pkgs.haskell.packages.ghc902;
      };
    };
}
