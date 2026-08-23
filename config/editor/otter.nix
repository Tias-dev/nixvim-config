{
  config,
  lib,
  ...
}: let
  langs =
    (lib.optionals (config.cpp.enable || config.all-langs.enable) ["c" "cpp"])
    ++ (lib.optional (config.python.enable || config.all-langs.enable) "python")
    ++ (lib.optional (config.lua.enable || config.all-langs.enable) "lua")
    ++ (lib.optional (config.yaml.enable || config.all-langs.enable) "yaml")
    ++ (lib.optional (config.nix.enable || config.all-langs.enable) "nix")
    ++ (lib.optional (config.tex.enable || config.all-langs.enable) "tex");
  langs-lua-array = "{${builtins.foldl' (str: lang:
    (
      if str != ""
      then str + ", "
      else str
    )
    + lang) ""
  langs}}";
in {
  plugins.otter = {
    enable = true;
    settings = {
      handle_leading_whitespace = true;
    };

    luaConfig.post =
      /*
      lua
      */
      ''
        require("otter").activate(${langs-lua-array})
      '';
  };
}
