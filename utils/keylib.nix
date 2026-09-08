rec {
  base = key: action: {
    key = key;
    action = action;
    options = {
      silent = true;
    };
    mode = ["n" "x"];
  };
  baseDesc = key: action: desc: (base key action) // {options.desc = desc;};
  baseSilent = key: action: (base key action) // {options.silent = true;};
}
