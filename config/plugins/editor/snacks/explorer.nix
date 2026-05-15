{
  plugins.snacks = {
    enable = true;
    settings = {
      explorer = {
        enable = true;
        replace_netrw = true;
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>lua require('snacks').explorer()<CR>";
      key = "<leader>e";
      options = {
        silent = true;
        desc = "Open explorer";
      };
    }
  ];
}
