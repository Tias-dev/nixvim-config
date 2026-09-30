{
  keyLib,
  pkgs,
  lib,
  config,
  ...
}: let
  sql-formatter-substituted = pkgs.writeShellScriptBin "sql-formatter-wrapped" ''
    fileName="$1"
    if [[ ! -f "$fileName" ]]; then
      echo "file: $fileName is not exists!"
      exit 1
    fi
    cat "$fileName" | sed 's/@/__dog_substituter__/g' | ${lib.getExe pkgs.sql-formatter} -l postgresql | sed 's/__dog_substituter__/@/g'
  '';
in {
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
            {
              "_" = [
                "trim_whitespace"
                "trim_newlines"
              ];
            }
            // (lib.optionalAttrs (config.cpp.enable || config.all-langs.enable) rec {
              cpp = ["clang_format"];
              c = cpp;
            })
            // (lib.optionalAttrs (config.python.enable || config.all-langs.enable) {
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
            // (lib.optionalAttrs config.nix.enable {
              nix = ["alejandra"];
            })
            // (lib.optionalAttrs config.tex.enable {
              latex = ["tex-fmt"];
            })
            // (lib.optionalAttrs config.lua.enable {
              lua = ["stylua"];
            })
            // rec {
              json = ["prettier"];
              yaml = json;
              xml = json;
            }
            // rec {
              xml = ["prettier"];
              javascript = xml;
              javascriptreact = xml;
              typescript = xml;
              typescriptreact = xml;
              css = xml;
              html = xml;
            }
            // (lib.optionalAttrs config.sql.enable {
              sql = ["sql-formatter"];
            });
          formatters = {
            sql-formatter = {
              command = "${lib.getExe sql-formatter-substituted}";
              args = ["$FILENAME"];
            };
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
      [prettier]
      ++ (lib.optionals config.python.enable [isort black python3Packages.autopep8])
      ++ (lib.optional config.lua.enable stylua)
      ++ (lib.optional config.cpp.enable clang-tools)
      ++ (lib.optional config.nix.enable alejandra)
      ++ (lib.optional config.tex.enable tex-fmt)
      ++ (lib.optional config.sql.enable sql-formatter)
    );
  };
}
