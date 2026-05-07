{
  plugins.startup = {
    enable = true;
    settings = {
      colors = {
        background = "#ffffff";
        folded_section = "#ffffff";
      };

      header = {
        type = "text";
        oldfiles_directory = false;
        align = "center";
        fold_section = false;
        title = "Header";
        margin = 5;
        content = [
          " ██████╗░███████╗░█████╗░░█████╗░██████╗░████████╗░░░████████╗███████╗░█████╗░██╗░░██╗"
          " ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝░░░╚══██╔══╝██╔════╝██╔══██╗██║░░██║"
          " ██║░░██║█████╗░░██║░░╚═╝██║░░██║██████╔╝░░░██║░░░░░░░░░██║░░░█████╗░░██║░░╚═╝███████║"
          " ██║░░██║██╔══╝░░██║░░██╗██║░░██║██╔══██╗░░░██║░░░░░░░░░██║░░░██╔══╝░░██║░░██╗██╔══██║"
          " ██████╔╝███████╗╚█████╔╝╚█████╔╝██║░░██║░░░██║░░░██╗░░░██║░░░███████╗╚█████╔╝██║░░██║"
          " ╚═════╝░╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚══════╝░╚════╝░╚═╝░░╚═╝"
        ];
        highlight = "Statement";
        default_color = "";
        oldfiles_amount = 0;
      };

      body = {
        type = "mapping";
        oldfiles_directory = false;
        align = "center";
        fold_section = false;
        title = "Menu";
        margin = 5;
        content = [
          [
            " Find File"
            ''lua require("snacks").picker.files()''
            "f"
          ]
          [
            "󰍉 Find Word"
            ''lua require("snacks").picker.grep()''
            "g"
          ]
          [
            " Recent Files"
            ''lua require("snacks").picker.recent()''
            "r"
          ]
          [
            "Restore last session"
            ''lua require("persistence").load({last=true})''
            "s"
          ]
        ];
        highlight = "string";
        default_color = "";
        oldfiles_amount = 0;
      };

      options = {
        paddings = [
          1
          3
        ];
      };

      parts = [
        "header"
        "body"
      ];
    };
  };
}
