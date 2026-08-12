{
  # extra keybind for change yaml shiftwidth. Plain ftplugin configs not work
  extraFiles."ftplugin/yaml.vim".text = ''
    map <leader>y <cmd>set shiftwidth=4<cr>
  '';
}
