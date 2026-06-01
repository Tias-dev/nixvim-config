{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources.default = [
        "lsp"
        "path"
        "snippets"
        "buffer"
      ];
      keymap = {
        preset = "default";
        "<Tab>" = ["accept" "fallback"];
        "<C-j>" = ["snippet_forward" "fallback"];
        "<C-k>" = ["snippet_backward" "fallback"];
        "<S-k>" = ["scroll_documentation_up" "fallback"];
        "<S-j>" = ["scroll_documentation_down" "fallback"];
      };
      completion = {
        menu = {
          border = "rounded";
          draw.treesitter = ["lsp"];
        };
        documentation = {
          window.border = "rounded";
          auto_show = true;
        };
        list.selection = {
          preselect = true;
          auto_insert = false;
        };
      };
      signature = {
        enabled = true;
        window.border = "single";
      };
    };
  };
}
