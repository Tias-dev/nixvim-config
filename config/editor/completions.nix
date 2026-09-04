{
  lib,
  config,
  ...
}: {
  options = {
    completion.blink-cmp.enable = lib.mkEnableOption "blink-cmp";
    completion.mini-completion.enable = lib.mkEnableOption "mini-completion";
  };
  config = {
    completion.blink-cmp.enable = lib.mkDefault (!config.completion.mini-completion.enable);
    plugins.blink-cmp = lib.optionalAttrs config.completion.blink-cmp.enable {
      enable = true;
      settings = {
        appearance = {
          # use_nvim_cmp_as_default = true;
          nerd_font_variant = "mono";
        };
        sources = {
          default = [
            "lsp"
            "snippets"
            "path"
            "buffer"
          ];
          providers = {
            lsp = {
              timeout_ms = 10;
            };
            path = {
              min_keyword_length = 0;
              score_offset = 3;
            };
          };
        };
        keymap = {
          preset = "default";
          "<Tab>" = ["accept" "fallback"];
          "<C-j>" = ["snippet_forward" "fallback"];
          "<C-k>" = ["snippet_backward" "fallback"];
          "<S-k>" = ["scroll_documentation_up" "fallback"];
          "<S-j>" = ["scroll_documentation_down" "fallback"];
        };
        completion = {
          trigger = {
            show_on_keyword = true;
            show_on_trigger_character = true;
            show_on_backspace_in_keyword = true;
          };
          keyword.range = "full";
          menu = {
            auto_show = true;
            auto_show_delay_ms = 0;
            border = "rounded";
            draw.treesitter = ["lsp"];
          };
          documentation = {
            window.border = "rounded";
            auto_show = true;
          };
          list.selection = {
            preselect = true;
            auto_insert = true;
          };
        };
        signature = {
          enabled = true;
          window.border = "single";
        };
      };
    };
    plugins.mini-completion = lib.optionalAttrs config.completion.mini-completion.enable {
      enable = true;
    };
  };
}
