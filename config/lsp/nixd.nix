{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nix.enable {
    lsp.servers.nixd = {
      enable = true;
      config = {
        cmd = ["nixd"];
        filetypes = ["nix"];
        rootMarkers = ["flake.nix" ".git"];
        settings = {
          nixpkgs.expr = "import <nixpkgs> {}";
          formatting.command = ["alejandra"];
        };
      };
    };
    extraPackages = [pkgs.nixd];
  };
}
