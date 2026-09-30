{
  lib,
  pkgs,
  config,
  ...
}: {
  config = lib.mkIf config.typescript.enable {
    plugins.lsp.servers.ts_ls = {
      enable = true;
    };
    extraPackages = with pkgs; [typescript-language-server];
  };
}
