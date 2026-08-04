{lib, ...}: {
  options.all-langs.enable = lib.mkEnableOption "All languages support";
  config = {
    # delete default grr, gri, gra etc lsp keymap s
    extraConfigLuaPre = ''
      for _, letter in ipairs({"n", "x", "r", "a", "i", "t"}) do
        vim.keymap.del("n", "gr"..letter)
      end
      vim.keymap.del("x", "gra")
    '';
    plugins.lsp = {
      enable = true;
      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code actions";
          };
        };
      };
    };
  };
}
