{ config, pkgs, ... } :
{
  programs.alacritty = {
    enable = true;
    settings = {

      import = [
        pkgs.alacritty-theme.gruvbox_dark
      ];

      font = {
        normal = {
          family = "jetbrainsmono nerd font mono";
          style = "regular";
        };
        bold = {
          family = "jetbrainsmono nerd font mono";
          style = "bold";
        };
      };

      window = {
        decorations = "none";
        startup_mode = "maximized";
        opacity = 0.8;
        padding = {
          x = 8;
          y = 8;
        };
      };

      selection = {
        save_to_clipboard = true;
      };

      cursor.style = {
        blinking = "on";
        shape = "block";
      };

    };

  };
}
