{pkgs, ...}: {
  plugins.lsp.servers.texlab.enable = true;
  extraPackages = [pkgs.texlab];
}
