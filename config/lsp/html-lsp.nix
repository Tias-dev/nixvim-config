{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf config.frontend.enable
    {
      plugins.lsp.servers.html.enable = true;
    };
}
