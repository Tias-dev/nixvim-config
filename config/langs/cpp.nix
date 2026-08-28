{lib, ...}: {
  options.cpp = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    indent-namespace = lib.mkEnableOption "indent for namespace";
  };
}
