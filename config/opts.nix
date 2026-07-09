{
  opts = {
    expandtab = true;
    softtabstop = 2;
    shiftwidth = 2;
    shiftround = true;
    tabstop = 2;
    smartindent = true;

    conceallevel = 2;
    cursorline = true;

    fillchars = {
      foldopen = "";
      foldclose = "";
      fold = " ";
      foldsep = " ";
      diff = "╱";
      eob = " ";
    };
    grepformat = "%f:%l:%c:%m";
    grepprg = "rg --vimgrep";

    ignorecase = true;
    smartcase = true;

    jumpoptions = "view";
    laststatus = 3;

    pumblend = 10;
    pumheight = 10;

    ruler = false;

    sessionoptions = ["buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds"];

    showmode = false;

    splitbelow = true;

    termguicolors = true;

    exrc = true;
    mouse = "";
    number = true;
    scrolloff = 10;
    relativenumber = true;
    completeopt = "menu,menuone,noselect";
    signcolumn = "number";
    winborder = "rounded";
  };
}
