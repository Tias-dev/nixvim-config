{keyLib, ...}: {
  keymaps = [
    (keyLib.baseDesc "<leader>pm" "<cmd>messages<cr>" "(misc) messages")
    (keyLib.baseDesc "ZZ" "<cmd>wqa<cr>" "Quit (save before)")
    (keyLib.baseDesc "ZQ" "<cmd>qa!<cr>" "Force quit (no save)")
  ];
}
