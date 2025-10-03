{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "/etc/nixos/home-manager/modules/fastfetch/lambda.png";
        height = 50;
        width = 48;
        type = "kitty-icat";
      };

      modules = [
        {
          type = "custom";
          format = "{#90}┌─────────────────────Hardware─────────────────────┐";
        }
        {
          type = "host";
          key = "  PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          format = "{1} {3}";
          key = "│  ├";
          keyColor = "green";
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = "│  ├󰍛";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "│  ├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "└  └󰍛";
          keyColor = "green";
        }

        {
          type = "custom";
          format = "{#90}└──────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "{#90}┌─────────────────────Software─────────────────────┐";
        }
        {
          type = "os";
          key = "  OS";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "│  ├";
          keyColor = "yellow";
        }
        # {
        #   type = "bios";
        #   keyColor = "yellow";
        #   key = "│ ├";
        # }
        {
          type = "packages";
          key = "│  ├󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "└  └";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = "  Composer";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "│  ├";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "└  └";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "{#90}└──────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "{#90}┌─────────────────────Lifeware─────────────────────┐";
        }
        {
          type = "command";
          key = "  Age";
          keyColor = "magenta";
          text = "/etc/nixos/home-manager/modules/fastfetch/life_year.bash";
        }
        {
          type = "custom";
          format = "{#90}└──────────────────────────────────────────────────┘";
        }
        # {
        #   type = "colors";
        #   paddingLeft = 1;
        #   paddingTop = 4;
        #   symbol = "circle";
        # }
      ];

      general = {
        thread = true;
      };
    };
  };
}
