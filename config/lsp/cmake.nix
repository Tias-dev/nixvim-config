{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf config.cpp.enable
    {
      plugins.lsp.servers.cmake.enable = true;
      extraPackages = [pkgs.cmake-language-server];
    };
}
