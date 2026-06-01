{inputs', ...}: {
  extraPlugins = [
    inputs'.tias-nixpkgs.packages.xkbswitch
  ];
  extraConfigLua = ''
     require("xkbswitch").setup({
       custom_layout_rules = {
         -- default english layout id
         user_us_layout_variation = "0",

         -- get current layout id
         get_current_layout = function ()
    local id = vim.fn.system("niri msg keyboard-layouts | rg '\\*' | awk '{print $2}'")
    id = string.gsub(id, "\n", "", 1)
    return id
         end,

         -- set layout by id
         -- @param layout any it is value returned by get_current_layout function
         set_layout = function (layout)
    if not layout then layout = "0" end
    vim.system({"niri", "msg", "action", "switch-layout", layout})
         end,
       }
     })
  '';
}
