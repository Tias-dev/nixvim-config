{pkgs, ...}: {
  extraPackages = with pkgs; [
    # lsp
    nixd
    clang-tools
    pyright
    ltex-ls
    lua-language-server
    bash-language-server
    cmake-language-server

    # formatters
    alejandra
    tex-fmt
    stylua
  ];
}
