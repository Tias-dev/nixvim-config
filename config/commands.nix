{
  userCommands = {
    GetBufferAbsPath = {
      command.__raw = ''
        function ()
          print(vim.api.nvim_buf_get_name(0))
        end
      '';
    };
    GetBufferAbsPathAndLine = {
      command.__raw = ''
        function ()
          print(vim.api.nvim_buf_get_name(0) .. ":" .. vim.api.nvim_win_get_cursor(0)[1])
        end
      '';
    };
    GetBufferBaseName = {
      command.__raw = ''
        function ()
          print(vim.fs.basename(vim.api.nvim_buf_get_name(0)))
        end
      '';
    };
    GetBufferBaseNameAndLine = {
      command.__raw = ''
        function ()
          print(vim.fs.basename(vim.api.nvim_buf_get_name(0)) .. ":" .. vim.api.nvim_win_get_cursor(0)[1])
        end
      '';
    };
  };
}
