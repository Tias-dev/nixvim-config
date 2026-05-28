{pkgs, ...}: {
  extraPackages = with pkgs; [
    # lsp
    nixd
    clang-tools
    pyright
    ltex-ls
    neocmakelsp
    lua-language-server

    # formatters
    alejandra
    tex-fmt
    stylua
  ];
}
