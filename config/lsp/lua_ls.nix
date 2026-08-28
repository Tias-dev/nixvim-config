{
  pkgs,
  lib,
  config,
  ...
}: {
  config =
    lib.mkIf (config.lua.enable || config.all-langs.enable)
    {
      plugins.lsp.servers.lua_ls.enable = true;
      extraPackages = [pkgs.lua-language-server];
    };
}
