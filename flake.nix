{
  description = "Latex development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
			texlive.combined.scheme-full
			lua
          ];

		  # Set library paths
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          ];
        };
      });
}
