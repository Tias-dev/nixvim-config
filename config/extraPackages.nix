{pkgs, ...}: {
  extraPackages = with pkgs; [
    # lsp
    nixd
    clang-tools
    pyright
    texlab
    lua-language-server
    bash-language-server
    cmake-language-server

    # formatters
    alejandra
    tex-fmt
    stylua
  ];
}
