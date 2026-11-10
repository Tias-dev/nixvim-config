{keyLib, ...}: {
  plugins.mini.modules.files = {
  };
  autoCmd = [
    {
      event = "User";
      pattern = "MiniFilesWindowOpen";
      callback = {
        __raw = ''
          function (args)
            local buf_id = args.data.buf_id
             -- Получаем общее количество строк (записей) в текущем окне mini.files
             local line_count = vim.api.nvim_buf_line_count(buf_id)

             -- Если в папке ровно один элемент
             if line_count == 1 then
               -- Получаем данные этой единственной записи на первой строке
               local entry = MiniFiles.get_fs_entry(buf_id, 1)

               -- Проверяем, что запись существует и это именно директория
               if entry and entry.fs_type == "directory" then
                 vim.schedule(function()
                   -- Ставим курсор на первую строку и заходим внутрь
                   vim.api.nvim_win_set_cursor(0, { 1, 0 })
                   MiniFiles.go_in()
                 end)
               end
             end
          end
        '';
      };
    }
  ];
  keymaps = [
    (keyLib.baseDesc "<leader>e" "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>" "Open explorer at current buffer path")
    (keyLib.baseDesc "<leader>E" "<cmd>lua MiniFiles.open()<cr>" "Open explorer(cwd)")
  ];
}
