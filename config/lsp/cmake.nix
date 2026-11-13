{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf config.cpp.enable
    {
      lsp.servers.cmake.enable = true;
      extraPackages = [pkgs.cmake-language-server];
    };
}
