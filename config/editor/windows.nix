{keyLib, ...}: {
  plugins.tmux-navigator.enable = true;
  keymaps = with keyLib; [
    (baseDesc "<leader><Tab><Tab>" "<cmd>tabnew<cr>" "New Tab")
    (baseDesc "<leader><Tab>d" "<cmd>tabclose<cr>" "Close current Tab")
    (baseDesc "<leader><Tab>o" "<cmd>tabonly<cr>" "Close other Tabs")
  ];
}
