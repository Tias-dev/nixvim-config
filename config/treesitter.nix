{config, lib, ...}: {
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
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      nix
      vim
      vimdoc
      xml
      yaml
      c
      cpp
      python
      latex
    ];
  };
  extraFiles."after/queries/cpp/indents.scm".text = lib.mkIf config.cpp.indent-namespace /*treesitter*/ ''
    ; extends

    (namespace_definition) @indent.begin
  '';
}
