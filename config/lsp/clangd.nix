{
  pkgs,
  lib,
  config,
  ...
}: {
  options.cpp = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  options.clangd = {
    disable-indexing = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf ( config.cpp.enable || config.all-langs.enable ) {
    plugins.lsp.servers.clangd = {
      enable = true;
      cmd =
        [
          "clangd"
          "--clang-tidy"
          "--header-insertion=iwyu"
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=llvm"
        ]
        ++ (lib.optional config.clangd.disable-indexing "--background-index=0");
    };
    extraPackages = [pkgs.clang-tools];
  };
}
