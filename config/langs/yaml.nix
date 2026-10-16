{
  lib,
  config,
  ...
}: {
  options.yaml.enable = lib.mkEnableOption "Yaml support";
  config = {
    yaml.enable = lib.mkDefault (false || config.all-langs.enable);
    files."ftplugin/yaml.lua" = {
      localOpts = {
        shiftwidth = 2;
        softtabstop = 2;
      };
    };
  };
}
