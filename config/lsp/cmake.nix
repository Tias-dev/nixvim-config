{
  pkgs,
  lib,
  config,
  ...
}: {
  options.cmake.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
  config =
    lib.mkIf config.cmake.enable
    {
      plugins.lsp.servers.cmake.enable = true;
      extraPackages = [pkgs.cmake-language-server];
    };
}
