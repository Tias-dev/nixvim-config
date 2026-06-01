{keyLib, ...}: {
  plugins.bufferline = {
    enable = true;
    settings = {};
  };
  keymaps = with keyLib; [
    (base "<S-L>" "<cmd>BufferLineCycleNext<cr>")
    (base "<S-H>" "<cmd>BufferLineCyclePrev<cr>")
    (base "<leader>bo" "<cmd>BufferLineCloseOthers<cr>")
    (base "<leader>bP" "<cmd>BufferLineGroupClose ungrouped<cr>")
    (baseDesc "<leader>bd" "<cmd>bd<cr>" "delete current buffer")
  ];
}
