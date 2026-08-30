{lib, ...}: {
  plugins.alpha = {
    enable = true;
    # lazyLoad = {
    #   settings = {
    #     enabled.__raw =
    #       /*
    #       lua
    #       */
    #       ''
    #         function()
    #           return not vim.wo.diff
    #         end
    #       '';
    #   };
    # };
    settings = {
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            " ██████████ ██                              ██                 "
            "░░░░░██░░░ ░░                              ░██                 "
            "    ░██     ██  ██████    ██████           ░██  █████  ██    ██"
            "    ░██    ░██ ░░░░░░██  ██░░░░  █████  ██████ ██░░░██░██   ░██"
            "    ░██    ░██  ███████ ░░█████ ░░░░░  ██░░░██░███████░░██ ░██ "
            "    ░██    ░██ ██░░░░██  ░░░░░██      ░██  ░██░██░░░░  ░░████  "
            "    ░██    ░██░░████████ ██████       ░░██████░░██████  ░░██   "
            "    ░░     ░░  ░░░░░░░░ ░░░░░░         ░░░░░░  ░░░░░░    ░░    "
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[ene]] end";
              opts = {
                shortcut = "n";
              };
              type = "button";
              val = "  New file";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('snacks').picker.files() end";
              opts = {
                shortcut = "f";
              };
              type = "button";
              val = " Find File";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('snacks').picker.grep() end";
              opts = {
                shortcut = "g";
              };
              type = "button";
              val = "󰍉 Find Word";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('snacks').picker.recent({filter = {cwd = true}}) end";
              opts = {
                shortcut = "r";
              };
              type = "button";
              val = " Recent Files";
            }
            {
              on_press = lib.nixvim.mkRaw "function() require('persistence').load() end";
              opts = {
                shortcut = "s";
              };
              type = "button";
              val = "Restore last session";
            }
            {
              on_press = lib.nixvim.mkRaw "function() vim.cmd[[qa]] end";
              opts = {
                shortcut = "q";
              };
              type = "button";
              val = "󰩈 Quit Neovim";
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "Keyword";
            position = "center";
          };
          type = "text";
          val = "Нормально делай, нормально будет";
        }
      ];
    };
  };
}
