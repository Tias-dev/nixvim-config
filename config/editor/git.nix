{
  keyLib,
  lib,
  ...
}: let
  hunk_nav_func =
    lib.nixvim.mkRaw
    ''
      function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end, { desc = 'Перейти к следующему Git изменению' })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end, { desc = 'Перейти к предыдущему Git изменению' })
        end
    '';
in {
  plugins.gitsigns = {
    enable = true;
    settings = {
      on_attach = hunk_nav_func;
    };
  };

  keymaps = with keyLib; [
    (baseDesc "<leader>gb" "<cmd>Gitsigns blame<cr>" "blame file")
    (baseDesc "<leader>gd" "<cmd>Gitsigns diffthis<cr>" "diff file")

    (baseDesc "<leader>gs" "<cmd>Gitsigns select_hunk<cr>" "select hunk")
    (baseDesc "<leader>gp" "<cmd>Gitsigns preview_hunk_inline<cr>" "preview hunk")
    (baseDesc "<leader>gq" "<cmd>Gitsigns setqflist<cr>" "(qfixlist) select hunk")
    (baseDesc "<leader>gl" "<cmd>Gitsigns setloclist<cr>" "(loclist) select hunk")
    (baseDesc "<leader>gl" "<cmd>Gitsigns setloclist<cr>" "(loclist) select hunk")

    (baseDesc "<leader>ub" "<cmd>Gitsigns toggle_current_line_blame<cr>" "(git) blame line")
    (baseDesc "<leader>us" "<cmd>Gitsigns toggle_signs<cr>" "(git) show git signs")
  ];

  plugins.mini-clue.settings.clues = [
    {
      mode = "n";
      keys = "<leader>g";
      desc = "+Git";
    }
  ];
}
