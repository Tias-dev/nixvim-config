{
  description = "My neovim configuration with the power of nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim.url = "github:nix-community/nixvim";
    harpoon-bufferline = {
      url = "github:Tias-dev/harpoon-bufferline.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nixvim,
      harpoon-bufferline,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        harpoon-bufferline-plugin = (import harpoon-bufferline { inherit system; }).default;
        nixvimModule = {
          module = import ./config;
          extraSpecialArgs = {
            # harpoon-bufferline = import harpoon-bufferline { inherit system; };
            harpoon-bufferline = pkgs.vimUtils.buildVimPlugin {
              name = "harpoon-bufferline";
              src = pkgs.fetchFromGitHub {
                owner = "Tias-dev";
                repo = "harpoon-bufferline.nvim";
                rev = "bfd96180f0ab196d0bae46e38bb8b89e4a02c8c5";
                hash = "sha256-L7k7X5PAd+OcmeyeQKZV3NQbXnEgwf9ZvXrM1o+2Clc=";
              };
            };
          };
        };
        nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      in
      {
        packages.default = nvim;
        devShells.default = pkgs.mkShell { };
      }
    );
}
