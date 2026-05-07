{
  description = "My neovim configuration with the power of nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nixvim,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        nixvimModule = {
          module = import ./config;
        };
        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      in
      {
        packages.default = nvim;
        devShells.default = pkgs.mkShell {};
      }
    );
}
