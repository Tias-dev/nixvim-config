{
  plugins.bufferline = {
    enable = true;
    settings = { };
  };
  keymaps = [
    {
      action = "<cmd>BufferLineCycleNext<cr>";
      key = "<S-L>";
      options = {
        silent = true;
      };
    }
    {
      action = "<cmd>BufferLineCyclePrev<cr>";
      key = "<S-H>";
      options = {
        silent = true;
      };
    }
  ];
}
