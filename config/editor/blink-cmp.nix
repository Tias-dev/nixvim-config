{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      sources.default = [
	"lsp"
	"snippets"
	"buffer"
	"path"
      ];
      keymap = {
	preset = "default";
	"<Tab>" = ["accept" "fallback"];
	"<C-j>" = ["snippet_forward" "fallback"];
	"<C-k>" = ["snippet_backward" "fallback"];
      };
      completion = {
	menu = {
	  border = "rounded";
	  draw.treesitter = ["lsp"];
	};
	documentation.window.border = "rounded";
      };
      signature.enabled = true;
    };
  };
}
