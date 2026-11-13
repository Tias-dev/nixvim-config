{
  config,
  lib,
  ...
}: {
  lsp.servers.sqls = lib.mkIf config.sql.enable {
    enable = true;
  };
}
