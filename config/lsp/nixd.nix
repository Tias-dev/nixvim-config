{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
  config = lib.mkIf (config.nix.enable || config.all-langs.enable) {
    plugins.lsp.servers.nixd = {
      enable = true;
      cmd = ["nixd"];
      filetypes = ["nix"];
      rootMarkers = ["flake.nix" ".git"];
      settings = {
        nixpkgs.expr = "import <nixpkgs> {}";
        formatting.command = ["alejandra"];
        options = {
          nixos.expr = ''(builtins.getFlake "$HOME/nix").nixosConfigurations.<hostname>.options'';
          home_manager.expr = ''(builtins.getFlake "$HOME/nix").nixosConfigurations.<username>.options'';
        };
      };
    };
    extraPackages = [pkgs.nixd];
  };
}
