{keyLib, ...}: {
  plugins.mini.modules.files = {};
  keymaps = [
    (keyLib.baseDesc "<leader>e" "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>" "Open explorer at current buffer path")
    (keyLib.baseDesc "<leader>E" "<cmd>lua MiniFiles.open()<cr>" "Open explorer(cwd)")
  ];
}
