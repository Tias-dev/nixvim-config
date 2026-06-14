{
  plugins.flash = {
    enable = true;
  };
  keymaps = [
    {
      mode = ["x" "n" "o"];
      key = "ss";
      action = ''<cmd>lua require("flash").jump()<cr>'';
      options = {desc = "Flash";};
    }
    {
      mode = ["x" "n" "o"];
      key = "S";
      action = ''<cmd>lua require("flash").treesitter()<cr>'';
      options = {desc = "Flash Treesitter";};
    }
    {
      mode = ["o"];
      key = "r";
      action = ''<cmd>lua require("flash").remote()<cr>'';
      options = {desc = "Remote Flash";};
    }
  ];
}
