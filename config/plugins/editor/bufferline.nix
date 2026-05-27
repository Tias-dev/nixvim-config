{keyLib, ... }: {
  plugins.bufferline = {
    enable = true;
    settings = { };
  };
  keymaps = [
    (keyLib.base "<S-L>" "<cmd>BufferLineCycleNext<cr>")
    (keyLib.base "<S-H>" "<cmd>BufferLineCyclePrev<cr>")
    (keyLib.base "<leader>bo" "<cmd>BufferLineCloseOthers<cr>")
    (keyLib.base "<leader>bP" "<cmd>BufferLineGroupClose ungroupped<cr>")
  ];
}
