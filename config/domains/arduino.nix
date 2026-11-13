{
  lib,
  config,
  pkgs,
  ...
}: {
  options.arduino.enable = lib.mkEnableOption "Arduino support";
  config = lib.mkIf config.arduino.enable {
    plugins.lsp.servers.arduino_language_server.enable = true;

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
