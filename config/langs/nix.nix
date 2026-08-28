{lib, ...}: {
  options.nix.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
}
