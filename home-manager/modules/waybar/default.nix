{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    style = lib.mkForce (builtins.readFile ./style.css);
    settings = {
      mainBar = {
        layer = "top";
        position = "top"; # Move the bar to the bottom
        height = 25;
        margin-top = 3; # Remove top margin
        margin-bottom = 0; # Remove bottom margin
        margin-left = 0;
        margin-right = 0;

        modules-left = [
          "custom/life-archive-toggle"
          "tray"
          "cava#left"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "clock"
          "pulseaudio"
          "custom/power-profiles"
          "custom/fan-speed" # added fan-speed module
          "battery"
        ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = ""; # exclamation / alert
            active = ""; # solid dot with ring
            visible = ""; # filled dot
            default = ""; # hollow circle
            empty = ""; # thin ring / indicator
          };

          interval = 10;
        };

        clock = {
          format = "󰥔 {:%a, %d %b, %I:%M %p}";
          tooltip = "true";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "󰥔 {:%d/%m}";
          interval = 45;
        };

        "cava#left" = {
          framerate = 30;
          autosens = 1;
          bars = 10;
          lower_cutoff_freq = 1;
          higher_cutoff_freq = 10000;
          interval = 20;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          input_delay = 3;
          hide_on_silence = true; # Hide when no audio is playing
          format-icons = [
            "<span foreground='#ffd0d0'> </span>"
            "<span foreground='#ffd0d0'>▂</span>"
            "<span foreground='#ffd0d0'>▃</span>"
            "<span foreground='#ffd0d0'>▄</span>"
            "<span foreground='#ffd0d0'>▅</span>"
            "<span foreground='#ffd0d0'>▆</span>"
            "<span foreground='#ffd0d0'>▇</span>"
            "<span foreground='#ffd0d0'>█</span>"
          ];
        };

        # "cava#right" = {
        #   framerate = 60;
        #   autosens = 1;
        #   bars = 5;
        #   lower_cutoff_freq = 50;
        #   higher_cutoff_freq = 10000;
        #   method = "pipewire";
        #   source = "auto";
        #   stereo = true;
        #   reverse = false;
        #   bar_delimiter = 0;
        #   monstercat = false;
        #   waves = false;
        #   input_delay = 2;
        #   format-icons = [
        #     "<span foreground='#cba6f7'>▁</span>"
        #     "<span foreground='#cba6f7'>▂</span>"
        #     "<span foreground='#cba6f7'>▃</span>"
        #     "<span foreground='#cba6f7'>▄</span>"
        #     "<span foreground='#89b4fa'>▅</span>"
        #     "<span foreground='#89b4fa'>▆</span>"
        #     "<span foreground='#89b4fa'>▇</span>"
        #     "<span foreground='#89b4fa'>█</span>"
        #   ];
        # };

        # "custom/playerctl#backward" = {
        #   format = "󰙣  ";
        #   on-click = "playerctl previous";
        #   on-scroll-up = "playerctl volume .05+";
        #   on-scroll-down = "playerctl volume .05-";
        # };

        # "custom/playerctl#play" = {
        #   format = "{icon}";
        #   return-type = "json";
        #   exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        #   on-click = "playerctl play-pause";
        #   on-scroll-up = "playerctl volume .05+";
        #   on-scroll-down = "playerctl volume .05-";
        #   format-icons = {
        #     Playing = "<span>󰏥 </span>"; # nf-md-play
        #     Paused = "<span>󰏤 </span>";  # nf-md-pause
        #     Stopped = "<span>󰓛 </span>"; # nf-md-stop
        #   };
        # };

        # "custom/playerctl#foward" = {
        #   format = "󰙡  ";
        #   on-click = "playerctl next";
        #   on-scroll-up = "playerctl volume .05+";
        #   on-scroll-down = "playerctl volume .05-";
        # };

        # "custom/playerlabel" = {
        #   format = "    {icon}  <span>{}</span>";
        #   "return-type" = "json";
        #   "max-length" = 30;
        #   exec = "playerctl -a metadata --format '{\"text\": \"{{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        #   "on-click-middle" = "playerctl play-pause";
        #   "on-click" = "playerctl previous";
        #   "on-click-right" = "playerctl next";
        #   "format-icons" = {
        #     Playing = "<span foreground='#98BB6C'></span>";
        #     Paused = "<span foreground='#E46876'></span>";
        #   };
        # };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "󰁹 {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-alt = "󰁹 {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          on-click = "${pkgs.writeShellScript "battery-menu" ''
            ${pkgs.wlogout}/bin/wlogout -p layer-shell
          ''}";
          interval = 60;
        };

        # network = {
        #   format-wifi = "{icon}  {essid}";
        #   format-icons = {
        #     wifi = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        #     ethernet = "󰈁";
        #     disconnected = "󰖪";
        #     linked = "󱘖";
        #   };
        #   format-ethernet = "󰈁 Connected";
        #   tooltip-format = "{ifname}: {ipaddr}/{cidr}\n{signalStrength}% at {frequency}MHz\n⬇️ {bandwidthDownBytes} ⬆️ {bandwidthUpBytes}";
        #   tooltip-format-disconnected = "Disconnected";
        #   format-linked = "󱘖 No IP";
        #   format-disconnected = "󰖪 Disconnected";
        #   on-click = "nm-connection-editor";
        #   interval = 5;
        # };

        pulseaudio = {
          format = "󰕾 {volume}%";
          format-muted = "󰖁 Muted";
          format-bluetooth = "󰂯 {volume}%";
          on-click = "pavucontrol";
          format-icons = {
            default = [
              "♪"
              "♪"
              "♪"
            ];
          };
          scroll-step = 5;
          interval = 10;
        };

        tray = {
          icon-size = 19;
          spacing = 5;
        };

        # add new power‐profiles module
        "custom/power-profiles" = {
          exec = "${pkgs.writeShellScriptBin "powermode" ''
            if tlp-stat -m | grep -q "battery"; then
              echo '𝗓ᶻ'
            else
              echo 'ϟ'
            fi
          ''}/bin/powermode";
          interval = 15;
          format = "{text}"; # Use only the {text} placeholder
          tooltip = true;
          tooltip-format = "Power profile: {}"; # Tooltip remains unchanged
          on-click = "${pkgs.writeShellScriptBin "powermode_set" ''
            if tlp-stat -m | grep -q "battery"; then
               sudo tlp ac
            else
               sudo tlp bat
            fi
          ''}/bin/powermode_set";
        };
        "custom/fan-speed" = {
          exec = "${pkgs.writeShellScriptBin "fanmode_status" ''
            #!/usr/bin/env bash
            # Show ☢ Auto if ALL fans are auto-controlled; otherwise show average Target Fan Speed.
            out="$(nbfc status 2>/dev/null)" || { echo "☢ N/A"; exit 0; }

            # Parse with awk by ':' separator; collect Auto flags and Target Fan Speeds for all fans.
            readout="$(printf "%s\n" "$out" | awk -F': *' '
              /^Auto Control Enabled[ \t]*:/ { auto[n++] = $2 }
              /^Target Fan Speed[ \t]*:/     { tfs[m++]  = $2 }
              END {
                auto_all = 1
                for (i = 0; i < n; i++) {
                  gsub(/[ \t\r]+/, "", auto[i])
                  if (auto[i] != "true") auto_all = 0
                }
                if (auto_all) {
                  print "AUTO"
                } else {
                  sum = 0
                  for (i = 0; i < m; i++) {
                    gsub(/[ \t\r]+/, "", tfs[i])
                    sum += tfs[i] + 0
                  }
                  avg = (m > 0) ? sum / m : 0
                  printf("%.0f\n", avg)
                }
              }
            ')"

            if [ "$readout" = "AUTO" ]; then
              echo "☢ Auto"
            else
              printf "☢ %.0f%%\n" "$readout"
            fi
          ''}/bin/fanmode_status";
          interval = 15;
          format = "{text}";
          tooltip = true;
          tooltip-format = "Fan speed: scroll ±10%, click=auto";
          on-click = "nbfc set --auto";

          on-scroll-up = "${pkgs.writeShellScriptBin "fanmode_up" ''
            #!/usr/bin/env bash
            out="$(nbfc status 2>/dev/null)" || exit 0
            # Determine current average Target Fan Speed; if AUTO, start from 50
            cur="$(printf "%s\n" "$out" | awk -F': *' '
              /^Auto Control Enabled[ \t]*:/ { auto[n++] = $2 }
              /^Target Fan Speed[ \t]*:/     { tfs[m++]  = $2 }
              END {
                auto_all = 1
                for (i = 0; i < n; i++) {
                  gsub(/[ \t\r]+/, "", auto[i])
                  if (auto[i] != "true") auto_all = 0
                }
                if (auto_all) { print "AUTO"; }
                else {
                  sum=0; for (i=0;i<m;i++){ gsub(/[ \t\r]+/, "", tfs[i]); sum += tfs[i]+0 }
                  avg = (m>0)? sum/m : 0
                  printf("%.0f\n", avg)
                }
              }
            ')"
            if [ "$cur" = "AUTO" ]; then cur=50; fi
            new=$((cur + 10)); if [ "$new" -gt 100 ]; then new=100; fi
            # Apply one setting for both fans (nbfc applies to all fans by default)
            nbfc set -s "$new"
          ''}/bin/fanmode_up";

          on-scroll-down = "${pkgs.writeShellScriptBin "fanmode_down" ''
            #!/usr/bin/env bash
            out="$(nbfc status 2>/dev/null)" || exit 0
            cur="$(printf "%s\n" "$out" | awk -F': *' '
              /^Auto Control Enabled[ \t]*:/ { auto[n++] = $2 }
              /^Target Fan Speed[ \t]*:/     { tfs[m++]  = $2 }
              END {
                auto_all = 1
                for (i = 0; i < n; i++) {
                  gsub(/[ \t\r]+/, "", auto[i])
                  if (auto[i] != "true") auto_all = 0
                }
                if (auto_all) { print "AUTO"; }
                else {
                  sum=0; for (i=0;i<m;i++){ gsub(/[ \t\r]+/, "", tfs[i]); sum += tfs[i]+0 }
                  avg = (m>0)? sum/m : 0
                  printf("%.0f\n", avg)
                }
              }
            ')"
            if [ "$cur" = "AUTO" ]; then cur=0; fi
            new=$((cur - 10)); if [ "$new" -lt 0 ]; then new=0; fi
            nbfc set -s "$new"
          ''}/bin/fanmode_down";
        };

        "custom/life-archive-toggle" = {
          format = "{text}";
          return-type = "json";
          # exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          exec = "${pkgs.writeShellScriptBin "life_archive_status" ''
            FLAG_FILE="/home/toonzzzrock/Pictures/LifeArchive/flag.txt"
            if [ ! -f "$FLAG_FILE" ]; then
              echo "false" > "$FLAG_FILE"
            fi
            flag=$(tr -d '[:space:]' < "$FLAG_FILE")
            if [ "$flag" = "true" ]; then
              echo '{"text": "λ", "tooltip": "Life Archive: ON (Click to disable)", "class": "on"}'
            else
              echo '{"text": "◼", "tooltip": "Life Archive: OFF (Click to enable)", "class": "off"}'
            fi
          ''}/bin/life_archive_status";
          on-click = "${pkgs.writeShellScriptBin "life_archive_toggle" ''
            FLAG_FILE="/home/toonzzzrock/Pictures/LifeArchive/flag.txt"
            mkdir -p "$(dirname "$FLAG_FILE")"
            if [ ! -f "$FLAG_FILE" ]; then
              echo "false" > "$FLAG_FILE"
            fi
            flag=$(tr -d '[:space:]' < "$FLAG_FILE")
            if [ "$flag" = "true" ]; then
              echo "false" > "$FLAG_FILE"
            else
              echo "true" > "$FLAG_FILE"
            fi
          ''}/bin/life_archive_toggle";
          interval = 120;
        };
      };
    };
  };
}
