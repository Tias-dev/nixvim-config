{keyLib, ...}: {
  plugins.snacks.settings.picker.enable = true;
  keymaps = with keyLib; [
    (baseDesc "<leader>ff" "<cmd>lua Snacks.picker.files()<cr>" "Find files")
    (baseDesc "<leader>fb" "<cmd>lua Snacks.picker.buffers()<cr>" "Find buffers")
    (baseDesc "<leader>fB" "<cmd>lua Snacks.picker.buffers({hidden = true, nofile = true})<cr>" "Find buffers (all)")

    (baseDesc "<leader>sc" "<cmd>lua Snacks.picker.commands()<cr>" "Search commands")
    (baseDesc "<leader>sC" "<cmd>lua Snacks.picker.command_history()<cr>" "Search command history")
    (baseDesc "<leader>sg" "<cmd>lua Snacks.picker.grep()<cr>" "Grep")
    (baseDesc "<leader>sw" "<cmd>lua Snacks.picker.grep_word()<cr>" "Grep current word")
    (baseDesc "<leader>sd" "<cmd>lua Snacks.picker.diagnostics()<cr>" "Search diagnostics")
    (baseDesc "<leader>sD" "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>" "Search buffer diagnostics")

    (baseDesc "<leader>cs" "<cmd>lua Snacks.picker.lsp_symbols()<cr>" "Lsp symbols")
  ];
}
