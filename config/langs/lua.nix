{
  lib,
  config,
  ...
}: {
  options.lua.enable = lib.mkEnableOption "lua support";
  config = {
    lua.enable = lib.mkDefault (false || config.all-langs.enable);
  };
}
