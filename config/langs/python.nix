{lib, ...}: {
  options.python.enable = lib.mkEnableOption "Python integration";
  config.python.enable = lib.mkDefault true;
}
