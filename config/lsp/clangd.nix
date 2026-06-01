{pkgs, ...}: {
  plugins.lsp.servers.clangd.enable = true;
  extraPackages = [pkgs.clang-tools];
}
