{
  pkgs,
  lib,
  config,
  ...
}: {
  options.tex.enable = lib.mkEnableOption "Tex support";
  config = lib.mkIf config.tex.enable {
    plugins.lsp.servers.texlab.enable = true;
    extraPackages = [pkgs.texlab];
  };
}
