{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.tex.enable {
    plugins.lsp.servers.texlab.enable = true;
    extraPackages = [pkgs.texlab];
  };
}
