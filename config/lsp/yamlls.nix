{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf config.yaml.enable {
    lsp.servers.yamlls = {
      enable = true;
    };
    extraPackages = with pkgs; [yaml-language-server];
  };
}
