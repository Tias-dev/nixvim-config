{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.python.enable {
    lsp.servers.pyright.enable = true;
    extraPackages = [pkgs.pyright];
  };
}
