{pkgs, ...}: {
  plugins.lsp.servers.pyright.enable = true;
  extraPackages = [pkgs.pyright];
}
