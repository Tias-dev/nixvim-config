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
        {
          mode = "n";
          keys = "<leader>b";
          desc = "+Buffers";
        }
        {
          mode = "n";
          keys = "<leader>c";
          desc = "+Code";
        }
        {
          mode = "n";
          keys = "<leader>f";
          desc = "+Find(files)";
        }
        {
          mode = "n";
          keys = "<leader>s";
          desc = "+Search(Code)";
        }
        {
          mode = "n";
          keys = "<leader>h";
          desc = "+Pinned buffers";
        }
        {
          mode = "n";
          keys = "<leader><Tab>";
          desc = "+Tabs";
        }
        {
          mode = "n";
          keys = "<leader>n";
          desc = "+Neogen";
        }
      ];
    };
  };
}
