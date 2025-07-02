{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    style = lib.mkForce (builtins.readFile ./style.css);
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        
        modules-left = [
          "tray"
          "cava#left"
        ];
        modules-center = [
          "hyprland/workspaces"
          "custom/playerlabel"
        ];
        modules-right = [
          "pulseaudio"
          "clock"
          "custom/power-profiles"   # ← inserted here
          "battery"
        ];

        "hyprland/language" = {
          format-en = "󱃤 US";
          format-th = "󱃤 TH";
          min-length = 5;
          tooltip = true;
          tooltip-format = "Current layout: {}";
          on-click = "${pkgs.writeShellScript "switch-kb-layout" ''
            KB_DEVICE=$(${pkgs.hyprland}/bin/hyprctl devices -j | ${pkgs.jq}/bin/jq -r '.keyboards[0].name')
            CURRENT_LAYOUT=$(${pkgs.hyprland}/bin/hyprctl devices -j | ${pkgs.jq}/bin/jq -r '.keyboards[0].active_keymap')
            if [ "$CURRENT_LAYOUT" = "English (US)" ]; then
              ${pkgs.hyprland}/bin/hyprctl switchxkblayout "$KB_DEVICE" 1
            else
              ${pkgs.hyprland}/bin/hyprctl switchxkblayout "$KB_DEVICE" 0
            fi
          ''}";
        };

        # "custom/weather" = {
        #   format = " {} ";
        #   exec = "curl -s 'wttr.in/Tashkent?format=%c%t'";
        #   interval = 300;
        #   class = "weather";
        # };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{name}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
            sort-by-number = true;
          };
        };
        

        clock = {
          format = "󰥔 {:%a, %d %b, %I:%M %p}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "󰥔 {:%d/%m}";
        };
        
        "cava#left" = {
          framerate = 30;
          autosens = 1;
          bars = 30;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = true;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          input_delay = 1;
          hide_on_silence = true;  # Hide when no audio is playing
          format-icons = [ 
            "<span foreground='#c0c0c0'>▁</span>" 
            "<span foreground='#c0c0c0'>▂</span>" 
            "<span foreground='#c0c0c0'>▃</span>" 
            "<span foreground='#c0c0c0'>▄</span>" 
            "<span foreground='#c0c0c0'>▅</span>" 
            "<span foreground='#c0c0c0'>▆</span>" 
            "<span foreground='#c0c0c0'>▇</span>" 
            "<span foreground='#c0c0c0'>█</span>" 
          ];
        };
        
        "cava#right" = {
          framerate = 60;
          autosens = 1;
          bars = 18;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          input_delay = 2;
          format-icons = [ 
            "<span foreground='#cba6f7'>▁</span>" 
            "<span foreground='#cba6f7'>▂</span>" 
            "<span foreground='#cba6f7'>▃</span>" 
            "<span foreground='#cba6f7'>▄</span>" 
            "<span foreground='#89b4fa'>▅</span>" 
            "<span foreground='#89b4fa'>▆</span>" 
            "<span foreground='#89b4fa'>▇</span>" 
            "<span foreground='#89b4fa'>█</span>" 
          ];
        };
        
        "custom/playerctl#backward" = {
          format = "󰙣 "; 
          on-click = "playerctl previous";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
        };
        
        "custom/playerctl#play" = {
          format = "{icon}";
          return-type = "json";
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "playerctl play-pause";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
          format-icons = {
            Playing = "<span>󰏥 </span>"; # nf-md-play
            Paused = "<span>󰏤 </span>";  # nf-md-pause
            Stopped = "<span>󰓛 </span>"; # nf-md-stop
          };
        };
        
        "custom/playerctl#foward" = {
          format = "󰙡 ";
          on-click = "playerctl next";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
        };
        
        "custom/playerlabel" = {
          format = "󰎈 {}";
          return-type = "json";
          max-length = 40;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "";
        };

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
          format-icons = ["" "" "" "" ""];
          on-click = "${pkgs.writeShellScript "battery-menu" ''
            ${pkgs.wlogout}/bin/wlogout -p layer-shell
          ''}";
        };

        network = {
          format-wifi = "{icon} {essid}";
          format-icons = {
            wifi = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
            ethernet = "󰈁";
            disconnected = "󰖪";
            linked = "󱘖";
          };
          format-ethernet = "󰈁 Connected";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}\n{signalStrength}% at {frequency}MHz\n⬇️ {bandwidthDownBytes} ⬆️ {bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          format-linked = "󱘖 No IP";
          format-disconnected = "󰖪 Disconnected";
          on-click = "nm-connection-editor";
          interval = 5;
        };

        pulseaudio = {
          format = "󰕾 {volume}%";
          format-muted = "󰖁 Muted";
          format-bluetooth = "󰂯 {volume}%";
          on-click = "pavucontrol";
          format-icons = {
            default = ["♪" "♪" "♪"];
          };
          scroll-step = 5;
        };

        tray = {
          icon-size = 20;
          spacing = 8;
        };
        
        # add new power‐profiles module
        "custom/power-profiles" = {
          exec       = "powerprofilesctl get";
          interval   = 5;
          format     = "{}";
          tooltip    = true;
          tooltip-format = "Power profile: {}";
          on-click   = "powerprofilesctl set $([ \"$(powerprofilesctl get)\" = power-saver ] && echo performance || echo power-saver)";
        };
      };
    };
  };
}