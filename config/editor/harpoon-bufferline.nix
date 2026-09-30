{
  inputs',
  lib,
  config,
  ...
}: {
  options.harpoon-bufferline = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "whether enable harpoon bufferline integration";
        };
        auto-pin-harpooned-buffers = lib.mkEnableOption "Automatically pin harpooned buffers when nvim is opened";
      };
    };
  };
  config = lib.mkIf config.harpoon-bufferline.enable {
    extraPlugins = [
      inputs'.tias-nixpkgs.packages.harpoon-bufferline
    ];
    extraConfigLua = ''
      require("harpoon-bufferline").setup(
         ${lib.nixvim.lua.toLuaObject {auto_pin_harpoon_buffers = config.harpoon-bufferline.auto-pin-harpooned-buffers;}}
      )
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
  };
}
