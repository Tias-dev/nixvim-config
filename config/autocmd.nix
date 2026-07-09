{
  autoCmd = [
    {
      event = "CursorMoved";
      callback = {
        __raw = ''
          function ()
            if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
              vim.schedule(function () vim.cmd.nohlsearch() end)
            end
          end
        '';
      };
    }
  ];
}
