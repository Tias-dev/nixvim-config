{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf config.frontend.enable
    {
      lsp.servers.html.enable = true;
    };
}
