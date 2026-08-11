{keyLib, ...}: {
  plugins.neogen.enable = true;
  keymaps = [
    (keyLib.baseDesc "<leader>ng" "<cmd>Neogen<cr>" "Gen annotations(auto)")
    (keyLib.baseDesc "<leader>nf" "<cmd>Neogen func<cr>" "Gen annotations(func)")
    (keyLib.baseDesc "<leader>nc" "<cmd>Neogen class<cr>" "Gen annotations(class)")
  ];
}
