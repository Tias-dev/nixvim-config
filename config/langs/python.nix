{
  lib,
  config,
  ...
}: {
  options.python.enable = lib.mkEnableOption "Python integration";
  config.python.enable = lib.mkDefault (false || config.all-langs.enable);
}
