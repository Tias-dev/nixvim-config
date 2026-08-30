{lib, ...}: {
  plugins.alpha = {
    enable = true;
    lazyLoad = {
      settings = {
        enabled.__raw =
          /*
          lua
          */
          ''
            function()
              return not vim.wo.diff
            end
          '';
      };
    };
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
          val = 4;
        }
        {
          type = "group";
          opts.spacing = 1;
          val = let
            keybind =  key: desc: strActionFunc: 
              rec {
              on_press = lib.nixvim.mkRaw strActionFunc;
              type = "button";
              val = desc;
              opts = {
                shortcut = key;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
                cursor = 3;
                width = 50;
                position = "center";
                keymap = ["n" key on_press {silent = true; noremap = true;}];
              };
            };
            in [
            (keybind "n" "  New file" "function() vim.cmd[[ene]] end")
            (keybind "f" "  Find File" "function() require('snacks').picker.files() end")
            (keybind "g" "󰍉  Find Word" "function() require('snacks').picker.grep() end")
            (keybind "r" "  Recent Files" "function() require('snacks').picker.recent({filter = {cwd = true}}) end")
            (keybind "s" "  Restore last session" "function() require('persistence').load() end")
            (keybind "q" "󰩈  Quit Neovim" "function() vim.cmd[[qa]] end")
          ];
        }
        {
          type = "padding";
          val = 4;
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
