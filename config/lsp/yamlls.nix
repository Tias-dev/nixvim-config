{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf (config.yaml.enable || config.all-langs.enable) {
    plugins.lsp.servers.yamlls = {
      enable = true;
    };
    extraPackages = with pkgs; [yaml-language-server];
  };
}
