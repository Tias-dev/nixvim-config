{
  lib,
  config,
  ...
}: {
  options.tex.enable = lib.mkEnableOption "Tex support";
  config.tex.enable = lib.mkDefault (false || config.all-langs.enable);
}
