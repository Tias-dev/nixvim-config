{keyLib, ...}: {
  plugins.mini.modules.files = {};
  keymaps = [
    (keyLib.baseDesc "<leader>e" "<cmd>lua MiniFiles.open()<cr>" "Open explorer")
  ];
}
