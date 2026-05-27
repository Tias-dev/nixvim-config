rec {
  base = key: action: {
    key = key;
    action = action;
    options = {
      silent = true;
    };
  };
  baseDesc = key: action: desc: (base key action) // {options.desc = desc;};
}
