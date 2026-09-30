{lib, config, ...}: {
  options.html.enable = lib.mkEnableOption "html support";
  config = {
    html.enable = lib.mkDefault ( false || config.all-langs.enable );
  };
}
