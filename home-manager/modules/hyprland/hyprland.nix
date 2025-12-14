{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  home.file.".config/hypr/xdph.conf".text = ''
    screencopy {
      allow_token_by_default = true
    }
  '';

  services.dunst = {
    enable = true;
    settings = {
      global = {
        browser = "${
          inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        }/bin/zen -new-tab";
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
        follow = "mouse";
        frame_color = lib.mkForce "#000000a5";
        frame_width = 2;
        geometry = "300 x30-5 + 60";
        horizontal_padding = 8;
        indicate_hidden = "yes";
        icon_position = "off";
        line_height = 0;
        markup = "full";
        padding = 8;
        startup_notification = false;
        vertical_alignment = "center";
        # Show age of message if message is older than x seconds
        show_age_threshold = -1;
        # Split notifications into multiple lines
        word_wrap = "no";
        shrink = "no";
        # If message too long, add ellipsize to...
        ellipsize = "middle";
        # Ignore newlines in notifications
        ignore_newline = "no";
        separator_height = 2;
        transparency = 8;
        font = "JetBrains Mono Nerd Font 10";
        format = ''
          <b>%a</b>
          <i>%s</i>
          %b'';
        corner_radius = 15;
      };

      urgency_low = {
        background = lib.mkForce "#000000a5";
        foreground = lib.mkForce "#ffd0d0";
        timeout = 3;
      };

      urgency_normal = {
        background = lib.mkForce "#000000a5";
        foreground = lib.mkForce "#e882a6ff";
        timeout = 5;
      };

      urgency_critical = {
        background = lib.mkForce "#000000a5";
        foreground = lib.mkForce "#f06595";
        timeout = 10;
      };
    };
  };
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      wallpaper = {
        path = "/etc/nixos/wallpapers/yottea.png";
        fit_mode = "cover";
      };
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    portalPackage = null;
    package = null;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };

    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
    ];
    settings = {
      exec-once = [
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"

        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY"

        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "killall -q hyprpaper;sleep .5 && hyprpaper"
        "nvidia-offload waybar"
        "pypr"
        "dunst"
        "sudo rm -rf /home/toonzzzrock/.cache/cliphist"
        "[workspace 1 silent] nvidia-offload zen"
        "[workspace 2 silent] nvidia-offload code"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 2;
        float_switch_override_focus = 0;
        sensitivity = 0;
        focus_on_close = 1;
        accel_profile = "flat";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };
      device = {
        name = "at-translated-set-2-keyboard";
        # change language via caps lock
        kb_layout = "us,th";
        kb_options = "grp:caps_toggle";
      };
      gestures = {
        # workspace_swipe = 1;
        # workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
        gesture = "3, horizontal, workspace";
      };

      general = {
        "$modifier" = "SUPER";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 5;
        border_size = 1;
        # red and black-red gradient
        "col.active_border" = "rgba(b8212163) rgba(320202ee) 45deg";

        resize_on_border = true;
      };
      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        disable_hyprland_logo = true;
        disable_autoreload = false; # true to disable config reload on save
        disable_splash_rendering = false;
        enable_swallow = false;
        vfr = true; # Variable Frame Rate
        vrr = 0; # Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen black momentarily or going black when app is fullscreen
        # Try setting vrr to 0z
      };
      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      render = {
        cm_enabled = true;
        direct_scanout = 1;
        new_render_scheduling = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 9;
          passes = 2;
          ignore_opacity = true;
          new_optimizations = true;
          noise = 0.1;
          brightness = 0.8;
          xray = true;
          popups = true;
          input_methods = true;
        };
        shadow = {
          enabled = false;
          # range = 4;
          # render_power = 3;
          # color = "rgba(1a1a1aee)";
        };
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 1; # change to 1 if want to disable
        no_warps = false;
        persistent_warps = true;
        warp_on_change_workspace = 1;
        warp_on_toggle_special = 0;
        min_refresh_rate = 30;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      experimental = {
        xx_color_management_v4 = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
    };

    extraConfig = ''
      source = ~/.config/hypr/monitors.conf

      plugin {
        split-monitor-workspaces {
          count = 4
          keep_focused = 0
          enable_notifications = 0
          enable_persistent_workspaces = 1
        }
      }
    '';

  };
}
