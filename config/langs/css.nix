{lib, config,...}: {
  options.css.enable = lib.mkEnableOption "css support";
  config =  {
    plugins = lib.mkIf config.css.enable { colorizer.enable = true; };
    css.enable = lib.mkDefault (false || config.all-langs.enable);
  };
}
