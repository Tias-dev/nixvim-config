{
  keyLib,
  lib,
  ...
}: {
  keymaps = with keyLib; [
    (baseDesc "<leader>pm" "<cmd>messages<cr>" "(misc) messages")
    (baseDesc "ZZ" "<cmd>wqa<cr>" "Quit (save before)")
    (baseDesc "ZQ" "<cmd>qa!<cr>" "Force quit (no save)")
    (baseDesc "ZQ" "<cmd>qa!<cr>" "Force quit (no save)")
    (baseExpr "j" "v:count == 0 ? 'gj' : 'j'")
    (baseExpr "k" "v:count == 0 ? 'gk' : 'k'")
  ];
}
