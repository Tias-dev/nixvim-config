{lib, config,...}: {
  options.css.enable = lib.mkEnableOption "css support";
  config = lib.mkIf config.css.enable {
    plugins.colorizer.enable = true;
  };
}
