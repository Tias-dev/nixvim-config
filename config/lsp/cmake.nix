{pkgs, ...}: {
  plugins.lsp.servers.cmake.enable = true;
  extraPackages = [pkgs.cmake-language-server];
}
