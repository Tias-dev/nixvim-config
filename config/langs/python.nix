{lib, ...}: {
  options.python.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };
}
