{
  lib,
  config,
  ...
}: {
  options.sql.enable = lib.mkEnableOption "sql integration";
  config = {
    sql.enable = lib.mkDefault (false || config.all-langs.enable);
  };
}
