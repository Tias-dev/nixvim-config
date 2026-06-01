{pkgs, ...}: {
  plugins.lsp.servers.lua_ls.enable = true;
  extraPackages = [pkgs.lua-language-server];
}
