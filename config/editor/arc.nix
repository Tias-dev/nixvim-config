{
  lib,
  config,
  inputs',
  ...
}: {
  options = {
    arc.enable = lib.mkEnableOption "arc integration";
  };
  config = lib.mkIf config.arc.enable {
    extraPlugins = [
      inputs'.tias-nixpkgs.packages.arcsigns
    ];
    extraConfigLua = ''
      vim.keymap.set("n", "<leader>ab", "<cmd>ArcSignsBlame<cr>", { silent = true, desc = "Arc blame" })
      vim.keymap.set("n", "<leader>ar", "<cmd>ArcSignsRefresh<cr>", { silent = true, desc = "Refresh Arc signs" })
    '';

    plugins.mini-clue.settings.clues = [
      {
        mode = "n";
        keys = "<leader>a";
        desc = "+Arc";
      }
    ];
  };
}
