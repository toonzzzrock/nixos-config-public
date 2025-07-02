{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        separator = " → ";
      };

      logo = {
        source = ./ano.jpg;
        type = "auto";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "OS";
          keyColor = "38;2;180;167;214"; # Light purple
        }
        {
          type = "kernel";
          key = " ├ λ ";
          keyColor = "38;2;180;167;214";
        }
        {
          type = "packages";
          key = " ├ 󰏗 ";
          keyColor = "38;2;180;167;214";
          format = "{1} (nix-system), {2} (flatpak)";
        }
        {
          type = "wm";
          key = " ├ 󰖲 ";
          keyColor = "38;2;180;167;214";
          format = "Hyprland {1} (Wayland)";
        }
        {
          type = "shell";
          key = " ├  ";
          keyColor = "38;2;180;167;214";
        }
         {
          type = "terminalfont";
          key = " └  ";
          keyColor = "38;2;180;167;214";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC";
          keyColor = "38;2;180;167;214";
        }
        {
          type = "cpu";
          key = " ├ 󰻠 ";
          keyColor = "38;2;180;167;214";
          format = "{1} ({3}) @ {7} GHz";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";
          key = " ├ 󰍹 ";
          keyColor = "38;2;180;167;214";
        }
        {
          type = "memory";
          key = " ├ 󰆼 ";
          keyColor = "38;2;180;167;214";
          format = "{1} / {2} ({3})";
          percentColor = { 
            low = "38;2;0;255;0";    # Green
            medium = "38;2;255;255;0"; # Yellow
            high = "38;2;255;0;0";     # Red
          };
        }
        {
          type = "swap";
          key = " ├ 󰓡 ";
          keyColor = "38;2;180;167;214";
          format = "{1} / {2} ({3})";
          percentColor = { 
            low = "38;2;0;255;0";
            medium = "38;2;255;255;0";
            high = "38;2;255;0;0";
          };
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "38;2;180;167;214";
          format = "{1} / {2} ({3}) - {4}";
          percentColor = {
            low = "38;2;0;255;0";
            medium = "38;2;255;255;0";
            high = "38;2;255;0;0";
          };
        }
        {
          type = "battery";
          key = " ├ 󰁹 ";
          keyColor = "38;2;180;167;214";
          format = "{1}% [AC Connected]";
          percentColor = {
            low = "38;2;255;0;0";
            medium = "38;2;255;255;0";
            high = "38;2;0;255;0";
          };
        }
        {
          type = "uptime"; # use jetbrains noto fonts
          key = " └ 󰃰 ";
          keyColor = "38;2;180;167;214";
        }
       
      ];
    };
  };
}
