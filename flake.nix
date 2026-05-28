{
  description = "My neovim configuration with the power of nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tias-nixpkgs = {
      url = "github:Tias-dev/tias-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
	pkgs,
	inputs',
	...
      }: let
      nixvimModule = {
	inherit pkgs;
	module = inputs.import-tree ./config;
	extraSpecialArgs = {
	  inherit inputs';
	  keyLib = import ./utils/keylib.nix;
	};
      };
      nvim = inputs'.nixvim.legacyPackages.makeNixvimWithModule nixvimModule;
      in {
	packages.default = nvim;
	devShells.default = pkgs.mkShellNoCC {
	  packages = [nvim];
	};
      };
    };
}
