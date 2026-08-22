{
  keyLib,
  lib,
  ...
}: {
  plugins.trouble = {
    enable = true;
  };

  keymaps = [
    (keyLib.baseDesc "<leader>xx" "<cmd>Trouble diagnostic toggle filter.buf=0<cr>" "Buffer Diagnostics")
    (keyLib.baseDesc "<leader>xX" "<cmd>Trouble diagnostic toggle<cr>" "Diagnostics")
    (keyLib.baseDesc "<leader>xL" "<cmd>Trouble loclist toggle<cr>" "Location List")
    (keyLib.baseDesc "<leader>xQ" "<cmd>Trouble qflist toggle<cr>" "Quickfix List")
    (keyLib.baseDesc "<leader>xq" (lib.nixvim.mkRaw ''
      function()
        if vim.bo[vim.api.nvim_win_get_buf(0)].buftype == "quickfix" then
          vim.schedule(function()
            vim.cmd([[cclose]])
            vim.cmd([[Trouble qflist open]])
          end)
        else
          print("Not in quickfix buffer!")
        end
      end
    '') "Reopen Quickfix in Trouble")

    (keyLib.baseDesc "<leader>cs" "<cmd>Trouble symbols toggle focus=false<cr>" "Symbols (Trouble)")
  ];
  autoCmd = [
    {
      event = "QuickFixCmdPost";
      callback = lib.nixvim.mkRaw ''
        function()
          vim.cmd([[Trouble qflist open]])
        end
      '';
    }
  ];

  plugins.mini-clue.settings.clues = [
    {
      mode = "n";
      keys = "<leader>x";
      desc = "+Trouble";
    }
  ];
}
