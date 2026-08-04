{lib, pkgs, config, ...}: {
  options.yaml.enable = lib.mkEnableOption "Yaml support";
  config = lib.mkIf config.yaml.enable {
    plugins.lsp.servers.yamlls = {
      enable = true;
    };
    extraPackages = with pkgs; [ yaml-language-server ];
  };
}
