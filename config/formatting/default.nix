{
  keyLib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = rec {
        lua = ["stylua"];
        cpp = ["clang_format"];
        c = cpp;
        python = ["isort" "black" "autopep8Experimental"];
        nix = ["alejandra"];
        latex = ["tex-fmt"];
        "_" = [
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      format_after_save = {
        lsp_format = "fallback";
      };
      formatters = {
        autopep8Experimental = {
          "inherit" = false;
          command = "autopep8";
          args = ["--experimental" "$FILENAME"];
        };
      };
    };
  };

  keymaps = [
    (keyLib.baseDesc "<leader>cf" ''<cmd>lua require("conform").format()<cr>'' "Format code")
  ];

  extraPackages = with pkgs; [
    python3Packages.autopep8
    stylua
    clang-tools
    isort
    black
    alejandra
    tex-fmt
  ];
}
