{
  config,
  lib,
  ...
}: {
  plugins.treesitter-context = {
    enable = true;
    settings = {
      max_lines = 10;
    };
  };
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    grammarPackages = with config.plugins.treesitter.package.builtGrammars;
      [
        bash
        json
        yaml
        vim
        vimdoc
        markdown
        nix
      ]
      ++ (lib.optionals config.lua.enable [lua])
      ++ (lib.optionals config.python.enable [python])
      ++ (lib.optionals config.frontend.enable [html css xml javascript typescript jsx tsx])
      ++ (lib.optionals config.tex.enable [latex])
      ++ (lib.optionals config.cpp.enable [make c cpp]);
  };
  extraFiles = lib.mkIf config.cpp.indent-namespace {
    "after/queries/cpp/indents.scm".text =
      /*
      treesitter
      */
      ''
        ; extends

        (namespace_definition) @indent.begin
      '';
  };
}
