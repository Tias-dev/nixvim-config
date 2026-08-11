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
    disable-auto-import = lib.mkOption {
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
          "--completion-style=detailed"
          "--function-arg-placeholders"
          "--fallback-style=llvm"
          "--header-insertion=${if config.clangd.disable-auto-import then "never" else "iwyu"}"
        ]
        ++ (lib.optional config.clangd.disable-indexing "--background-index=0");
    };
    extraPackages = [pkgs.clang-tools];
  };
}
