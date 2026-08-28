{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.python.enable || config.all-langs.enable) {
    plugins.lsp.servers.pyright.enable = true;
    extraPackages = [pkgs.pyright];
  };
}
