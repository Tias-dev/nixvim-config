let
  escapeKeymap = k1: k2: [
    {
      action = "<esc>";
      key = k1 + k2;
      options = {silent = true;};
      mode = ["i"];
    }
    {
      action = "<esc>";
      key = k2 + k1;
      options = {silent = true;};
      mode = ["i"];
    }
  ];
in {
  keymaps =
    (escapeKeymap "v" "n")
    ++ (escapeKeymap "V" "N")
    ++ (escapeKeymap "м" "т")
    ++ (escapeKeymap "М" "Т");
}
