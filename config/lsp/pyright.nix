{
  pkgs,
  lib,
  config,
  ...
}: {
  options.python.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
  config = lib.mkIf (config.python.enable || config.all-langs.enable) {
    plugins.lsp.servers.pyright.enable = true;
    extraPackages = [pkgs.pyright];
  };
}
