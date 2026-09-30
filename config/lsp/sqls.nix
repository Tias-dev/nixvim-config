{
  config,
  lib,
  ...
}: {
  plugins.lsp.servers.sqls = lib.mkIf config.sql.enable {
    enable = true;
  };
}
