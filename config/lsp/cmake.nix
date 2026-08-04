{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf ( config.cpp.enable || config.all-langs.enable )
    {
      plugins.lsp.servers.cmake.enable = true;
      extraPackages = [pkgs.cmake-language-server];
    };
}
