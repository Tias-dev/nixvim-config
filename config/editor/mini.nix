{lib, ...}: {
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      pairs = {};
      ai = {};
      icons = {};
      surround = {
        custom_surroundings = {
          T = {
            input = ["<(%w+)[^<>]->.-</%1>" "^<()%w+().*</()%w+()>$"];
            output = lib.nixvim.mkRaw ''
                function()
                local tag_name = MiniSurround.user_input('Tag name')
                if tag_name == nil then return nil end
                return { left = tag_name, right = tag_name }
              end
            '';
          };
        };
      };
      move = {};
      splitjoin = {};
    };
  };
}
