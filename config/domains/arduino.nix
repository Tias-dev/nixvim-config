{
  lib,
  config,
  pkgs,
  ...
}: {
  options.arduino.enable = lib.mkEnableOption "Arduino support";
  config = lib.mkIf config.arduino.enable {
    lsp.servers.arduino_language_server = {
      enable = true;
      config = {
        capabilities = {
          textDocument.semanticTokens = lib.nixvim.mkRaw "vim.NIL";
          workspace.semanticTokens = {
            refreshSupport = false;
          };
        };
      };
    };

    cpp.enable = true;

    plugins.treesitter = {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        arduino
      ];
    };
    extraPackages = with pkgs; [
      arduino-cli
    ];
  };
}
