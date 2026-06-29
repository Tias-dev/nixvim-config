{lib, ...}: {
  plugins.mini-clue = {
    enable = true;
    settings = {
      triggers = let
        unpack = keys: modes: (map (mode: {
            keys = keys;
            mode = mode;
          })
          modes);
      in
        [
          {
            keys = "[";
            mode = "n";
          }
          {
            keys = "]";
            mode = "n";
          }
          {
            keys = "<C-x>";
            mode = "i";
          }
          {
            keys = "<C-w>";
            mode = "n";
          }
        ]
        ++ (unpack "<leader>" ["n" "x"])
        ++ (unpack "g" ["x" "n"])
        ++ (unpack "'" ["n" "x"])
        ++ (unpack "`" ["n" "x"])
        ++ (unpack ''"'' ["n" "x"])
        ++ (unpack "<C-r>" ["i" "c"])
        ++ (unpack "z" ["n" "x"]);

      clues = [
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.square_brackets()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.builtin_completion()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.g()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.marks()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.registers()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.windows()")
        (lib.nixvim.mkRaw "require(\"mini.clue\").gen_clues.z()")
      ];
    };
  };
}
