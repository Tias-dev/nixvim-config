{lib, ...}: {
  options.nix.enable = lib.mkEnableOption "nix integration";
  config.nix.enable = lib.mkDefault true;
}
