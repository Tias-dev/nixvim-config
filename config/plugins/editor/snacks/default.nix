{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enable = true;
      input.enable = true;
      notifier.enable = true;
      picker.enable = true;
      animate.enable = true;
    };
  };
  imports = [
    ./explorer.nix
  ];
}
