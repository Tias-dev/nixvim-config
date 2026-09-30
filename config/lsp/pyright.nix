{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.python.enable {
    plugins.lsp.servers.pyright.enable = true;
    extraPackages = [pkgs.pyright];
  };
}
