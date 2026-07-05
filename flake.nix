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
    harpoon-bufferline = {
      url = "github:Tias-dev/harpoon-bufferline.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tias-nixpkgs = {
      url = "github:Tias-dev/tias-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {flake-parts, ...} @ inputs: let
    mkNixvim = {
      pkgs,
      inputs',
    }: modules:
      inputs'.nixvim.legacyPackages.makeNixvimWithModule {
        inherit pkgs;
        module = {imports = modules;};
        extraSpecialArgs = {
          inherit inputs';
          keyLib = import ./utils/keylib.nix;
        };
      };
    defaultModules = (inputs.import-tree ./config).imports;
  in
    flake-parts.lib.mkFlake {inherit inputs;} ({withSystem, ...}: {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      flake.lib = rec {
        neovimWithOverrides = system: extraModules:
          withSystem system ({
            inputs',
            pkgs,
            ...
          }:
            mkNixvim {
              inherit pkgs inputs';
            }
            (defaultModules
              ++ extraModules));
        neovimWithChangedOptions = system: optionValues:
          neovimWithOverrides system [{config = optionValues;}];
      };
      perSystem = {
        pkgs,
        inputs',
        ...
      }: let
        nvim =
          mkNixvim {
            inherit pkgs inputs';
          }
          defaultModules;
      in {
        packages = {
          default = nvim;
          bundable-nvim = nvim.overrideAttrs (_: _: {
            pname = "neovim";
            version = "1.0.0";
          });
        };

        apps.default = {
          type = "app";
          program = "${nvim}/bin/nvim";
        };

        devShells.default = pkgs.mkShellNoCC {
          packages = [nvim];
        };

        formatter = pkgs.alejandra;
      };
    });
}
