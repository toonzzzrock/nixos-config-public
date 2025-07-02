{
  config,
  inputs,
  pkgs,
  ...
}: let
  keyboardLayout = "us,th";
  stylixImage = ../../../wallpapers/2.png;

in {
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  # Place Files Inside Home Directory
  # home.file = {
  #   "Pictures/Wallpapers" = {
  #     source = ../../../wallpapers;
  #     recursive = true;
  #   };
  #   # ".face.icon".source = ./face.jpg;
  #   # ".config/face.jpg".source = ./face.jpg;
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      exec-once = [
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "[workspace 3 silent] obsidian"
        "[workspace 3 silent] discordcanary"
        "[workspace 1 silent] zen"
        "killall -q swww; sleep .3 && swww init && swww img ${stylixImage}"
        "swww img --outputs 'eDP-1' ${stylixImage}"
        "killall -q waybar;sleep .3 && waybar"
        # "killall -q swaync;sleep .3 && swaync"
        # "nm-applet --indicator"
        # "xfce4-power-manager"  # Start power manager on login
        "pypr"
        "cliphist wipe"
        # "sleep 15 && wallsetter"
        "[workspace 2 silent] code"
        ];

      input = {
        kb_layout = "${keyboardLayout}";
        kb_options = [
          grp:caps_toggle
        ];
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };

      general = {
        "$modifier" = "SUPER";
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        resize_on_border = true;

      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true;   # Variable Frame Rate 
        vrr = 0;   #Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0
      };  


      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 1; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
        min_refresh_rate = 60;
      };

      render = {
        explicit_sync = 1; # Change to 1 to disable
        explicit_sync_kms = 0;
        direct_scanout = 0;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      env = [
        "WAYLAND_DISPLAY, wayland-0"
        "NIXOS_OZONE_WL, 1"
        "GTK_USE_PORTAL, 0"
        "NVD_BACKEND,direct"
      #  "ELECTRON_ENABLE_WAYLAND, 1"
      #  "ELECTRON_OZONE_PLATFORM_HINT, wayland"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "BROWSER, zen-twilight.desktop"
        "HYPRSHOT_DIR,/home/toonzzzrock/Pictures/Screenshots"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "GBM_BACKEND, nvidia-drm"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM, wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, wayland"
        "MOZ_ENABLE_WAYLAND, 1"   
        "GSK_RENDERER,gl"
        # "AQ_DRM_DEVICES,/dev/dri/card0:dev/dri/card1"
        "EDITOR,nvim"
        "SUDO_EDITOR,nvim"
      ];
    };

    extraConfig = "
      monitor=ePD-1, preferred, auto, auto
      monitor=HDMI-A-1, preferred, auto, auto
    ";


  };
}
