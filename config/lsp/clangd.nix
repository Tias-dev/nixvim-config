{pkgs, ...}: {
  plugins.lsp.servers.clangd = {
    enable = true;
    cmd = [
      "clangd"
      "--background-index=0"
      "--clang-tidy"
      "--header-insertion=iwyu"
      "--completion-style=detailed"
      "--function-arg-placeholders"
      "--fallback-style=llvm"
    ];
  };
  extraPackages = [pkgs.clang-tools];
}
