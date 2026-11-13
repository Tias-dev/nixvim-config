{lib, ...}: {
  config = {
    # delete default grr, gri, gra etc lsp keymaps
    extraConfigLuaPre = ''
      for _, letter in ipairs({"n", "x", "r", "a", "i", "t"}) do
        vim.keymap.del("n", "gr"..letter)
      end
      vim.keymap.del("x", "gra")
    '';
    lsp = {
      keymaps = [
        {
          action = lib.nixvim.mkRaw "function() vim.diagnostic.open_float() end";
          key = "<leader>cl";
          options = {
            desc = "Line Diagnostics";
          };
        }
        {
          action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({count=-1, float=true}) end";
          key = "[d";
          options = {
            desc = "Prev Diagnostic";
          };
        }
        {
          action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({count=1, float=true}) end";
          key = "]d";
          options = {
            desc = "Next Diagnostic";
          };
        }
        {
          lspBufAction = "definition";
          key = "gd";
          options = {
            desc = "Goto Definition";
          };
        }
        {
          lspBufAction = "declaration";
          key = "gD";
          options = {
            desc = "Goto Declaration";
          };
        }
        {
          lspBufAction = "implementation";
          key = "gI";
          options = {
            desc = "Goto Implementation";
          };
        }
        {
          key = "gT";
          lspBufAction = "type_definition";
          options = {
            desc = "Type Definition";
          };
        }
        {
          lspBufAction = "hover";
          key = "K";
          options = {
            desc = "Hover";
          };
        }
        {
          lspBufAction = "rename";
          key = "<leader>cr";
          options = {
            desc = "Rename";
          };
        }
        {
          lspBufAction = "code_action";
          key = "<leader>ca";
          options = {
            desc = "Code actions";
          };
        }
      ];
    };
  };
}
