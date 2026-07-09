{config, ...}: {
  plugins.treesitter-context.enable = true;
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
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
}
