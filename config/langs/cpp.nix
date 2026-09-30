{lib, ...}: {
  options.cpp = {
    enable = lib.mkEnableOption "C/C++ integration";
    indent-namespace = lib.mkEnableOption "indent for namespace";
  };
  config = {
    cpp.enable = lib.mkDefault true;
  };
}
