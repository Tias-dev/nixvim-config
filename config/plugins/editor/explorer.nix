{keyLib, ...}: {
  plugins.oil = {
    enable = true;
  };
  keymaps = [
    (keyLib.baseDesc "<leader>e" "<cmd>Oil<cr>" "Open explorer")
  ];
}
