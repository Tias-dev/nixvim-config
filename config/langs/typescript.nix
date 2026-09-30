{lib, config, ...}: {
  options.typescript.enable = lib.mkEnableOption "typescript support";
  config.typescript.enable = lib.mkDefault (false || config.all-langs.enable);
}
