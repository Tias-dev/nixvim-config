{keyLib, ...}: {
  keymaps = [
    {
      action = "<esc>";
      key = "vn";
      options = {silent = true;};
      mode = ["i"];
    }
    {
      action = "<esc>";
      key = "мт";
      options = {silent = true;};
      mode = ["i"];
    }
    {
      action = "<esc>";
      key = "VN";
      options = {silent = true;};
      mode = ["i"];
    }
    {
      action = "<esc>";
      key = "МТ";
      options = {silent = true;};
      mode = ["i"];
    }
    {
      action = "v:count == 0 ? 'gj' : 'j'";
      key = "j";
      options = {
        silent = true;
        noremap = true;
        expr = true;
      };
    }
    {
      action = "v:count == 0 ? 'gk' : 'k'";
      key = "k";
      options = {
        silent = true;
        noremap = true;
        expr = true;
      };
    }
    (keyLib.baseDesc "<leader><tab><tab>" "<cmd>tabnew<cr>" "New tab")
    (keyLib.baseDesc "<leader><tab>o" "<cmd>tabonly<cr>" "Close other tabs")
    (keyLib.baseDesc "<leader><tab>d" "<cmd>tabclose<cr>" "Close current tabs")
  ];
}
