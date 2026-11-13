{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.tex.enable {
    lsp.servers.texlab.enable = true;
    extraPackages = [pkgs.texlab];
  };
}
