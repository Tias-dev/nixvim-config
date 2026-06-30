{keyLib, ...}: {
  plugins.bufferline = {
    enable = true;
    settings = {};
  };
  keymaps = with keyLib; [
    (baseDesc "<S-L>" "<cmd>BufferLineCycleNext<cr>" "Pick next buffer")
    (baseDesc "<S-H>" "<cmd>BufferLineCyclePrev<cr>" "Pick previous buffer")
    (baseDesc "<leader>bo" "<cmd>BufferLineCloseOthers<cr>" "Delete other buffers")
    (baseDesc "<leader>bP" "<cmd>BufferLineGroupClose ungrouped<cr>" "Delete unpinned buffers")
    (baseDesc "<leader>bd" "<cmd>bd<cr>" "Delete current buffer")
  ];
}
