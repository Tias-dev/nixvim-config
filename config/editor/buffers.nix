{keyLib, ...}: {
  keymaps = [
    (keyLib.baseDesc "<leader>pb" "<cmd>GetBufferBaseName<cr>" "(buffer) Name")
    (keyLib.baseDesc "<leader>pB" "<cmd>GetBufferAbsPath<cr>" "(buffer) AbsPath")
    (keyLib.baseDesc "<leader>pl" "<cmd>GetBufferBaseNameAndLine<cr>" "(buffer) Name + Line")
    (keyLib.baseDesc "<leader>pL" "<cmd>GetBufferAbsPathAndLine<cr>" "(buffer) AbsPath + Line")
  ];
  plugins.mini-clue.settings.clues = [
    {
      mode = "n";
      keys = "<leader>p";
      desc = "+Print";
    }
  ];
}
