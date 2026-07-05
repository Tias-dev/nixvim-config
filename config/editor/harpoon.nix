{inputs', ...}: {
  plugins.harpoon = {
    enable = true;
    settings = {};
  };
  extraPlugins = [
    inputs'.harpoon-bufferline.packages.default
  ];
  extraConfigLua = ''
    require("harpoon-bufferline").setup({})
  '';

  keymaps = [
    {
      action = "<cmd>lua require('harpoon'):list():next()<cr>";
      key = "<c-n>";
      options = {
        silent = true;
        desc = "switch to next harpoon buffer";
      };
    }
    {
      action = "<cmd>lua require('harpoon'):list():prev()<cr>";
      key = "<c-p>";
      options = {
        silent = true;
        desc = "switch to previous harpoon buffer";
      };
    }
    {
      action = "<cmd>lua require('harpoon-bufferline').clearList()<cr>";
      key = "<leader>hc";
      options = {
        silent = true;
        desc = "harpoon: clear list";
      };
    }
    {
      action = "<cmd>lua require('harpoon'):list():add()<cr>";
      key = "<leader>ha";
      options = {
        silent = true;
        desc = "harpoon: add buffer to list";
      };
    }
    {
      action = "<cmd>lua require('harpoon'):list():remove()<cr>";
      key = "<leader>hd";
      options = {
        silent = true;
        desc = "harpoon: delete buffer from list";
      };
    }
  ];
}
