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
          formatters_by_ft =
            rec {
              "_" = [
                "trim_whitespace"
                "trim_newlines"
              ];
            }
            // (lib.optionalAttrs (config.cpp.enable || config.all-langs.enable) rec {
              cpp = ["clang_format"];
              c = cpp;
            })
            // (lib.optionalAttrs (config.python.enable || config.all-langs.enable) rec {
              python = [
                "isort"
                "black"
                (
                  if config.autopep8.experimental.enable
                  then "autopep8Experimental"
                  else "autopep8"
                )
              ];
            })
            // (lib.optionalAttrs (config.nix.enable || config.all-langs.enable) rec {
              nix = ["alejandra"];
            })
            // (lib.optionalAttrs (config.tex.enable || config.all-langs.enable) rec {
              latex = ["tex-fmt"];
            })
            // (lib.optionalAttrs (config.lua.enable || config.all-langs.enable) rec {
              lua = ["stylua"];
            });
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

    extraPackages = with pkgs; (
      (lib.optionals (config.python.enable || config.all-langs.enable) [isort black python3Packages.autopep8])
      ++ (lib.optional (config.lua.enable || config.all-langs.enable) stylua)
      ++ (lib.optional (config.cpp.enable || config.all-langs.enable) clang-tools)
      ++ (lib.optional (config.nix.enable || config.all-langs.enable) alejandra)
      ++ (lib.optional (config.tex.enable || config.all-langs.enable) tex-fmt)
    );
  };
}
