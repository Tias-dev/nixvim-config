{lib, pkgs, config, ...}: {
  options.yamlls.enable = lib.mkEnableOption "Yaml support";
  config = lib.mkIf config.yamlls.enable {
    plugins.lsp.servers.yamlls = {
      enable = true;
    };
    extraPackages = with pkgs; [ yaml-language-server ];
  };
}
