{
  keyLib,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    autopep8.experimental.enable = lib.mkEnableOption "experimental";
    format.on_save.enable = lib.mkEnableOption "format on save";
  };
  config = {
    format.on_save.enable = lib.mkDefault true;
    plugins.conform-nvim = {
      enable = true;
      settings =
        {
          formatters_by_ft = rec {
            lua = ["stylua"];
            cpp = ["clang_format"];
            c = cpp;
            python = [
              "isort"
              "black"
              (
                if config.autopep8.experimental.enable
                then "autopep8Experimental"
                else "autopep8"
              )
            ];
            nix = ["alejandra"];
            latex = ["tex-fmt"];
            "_" = [
              "trim_whitespace"
              "trim_newlines"
            ];
          };
          formatters = {
            autopep8Experimental = {
              "inherit" = false;
              command = "autopep8";
              args = ["--experimental" "$FILENAME"];
            };
          };
        }
        // (lib.optionalAttrs config.format.on_save.enable {
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
          format_after_save = {
            lsp_format = "fallback";
          };
        });
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
  };
}
