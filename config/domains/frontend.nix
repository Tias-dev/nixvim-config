{lib, config, ...}: {
  options.frontend.enable = lib.mkEnableOption "frontend develop suite";
  config = lib.mkIf config.frontend.enable {
    html.enable = true;
    css.enable = true;
    typescript.enable = true;
  };
}
