{pkgs, ...}: {
  plugins.lsp.servers.clangd = {
    enable = true;
    cmd = [
      "clangd"
      "--background-index=false"
      "--clang-tidy"
      "--header-insertion=iwyu"
      "--completion-style=detailed"
      "--function-arg-placeholders"
      "--fallback-style=llvm"
    ];
  };
  extraPackages = [pkgs.clang-tools];
}
