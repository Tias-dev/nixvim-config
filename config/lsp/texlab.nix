{
  pkgs,
  lib,
  config,
  ...
}: {
  options.tex.enable = lib.mkEnableOption "Tex support";
  config = lib.mkIf ( config.tex.enable || config.all-langs.enable ) {
    plugins.lsp.servers.texlab.enable = true;
    extraPackages = [pkgs.texlab];
  };
}
