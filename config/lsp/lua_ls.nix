{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf config.lua.enable
    {
      lsp.servers.lua_ls.enable = true;
      extraPackages = [pkgs.lua-language-server];
    };
}
