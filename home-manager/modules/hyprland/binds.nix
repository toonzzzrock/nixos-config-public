{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "ALT, Space, exec, rofi-launcher"

      "SUPER_SHIFT, V, exec, memorize"
      "SUPER_ALT, W, exec, wallsetter"
      "SUPER, W, exec, nvidia-offload zen"
      "SUPER_SHIFT, W, exec, nvidia-offload brave"

      "SUPER, C, exec, nvidia-offload code"
      "SUPER_SHIFT, C, exec, kitty -e nvim"
      "SUPER_CONTROL, C, exec, nvidia-offload antigravity"

      "SUPER, O, exec, nvidia-offload obsidian"
      "SUPER_SHIFT, Z, exec, nvidia-offload zoom"
      "SUPER, B, exec, kitty -e bluetuith"
      "SUPER, D, exec, vesktop"

      "SUPER, Y, exec, kitty -e yazi"
      "SUPER, N, exec, kitty -e nmtui"
      "SUPER, M, exec, nvidia-offload pear-desktop"
      "SUPER_SHIFT, M, exec, kitty -e cava"
      "SUPER_ALT, M, exec, pavucontrol"

      "SUPER, S, exec, hyprshot -m window"
      "SUPER_SHIFT, S, exec, hyprshot -m output"
      "SUPER_ALT, S, exec, hyprshot -m region"

      "SUPER_ALT, C, exec, hyprpicker -a"
      "SUPER, T, exec, pypr toggle term"
      "SUPER_SHIFT, T, exec, kitty -e sudo btop"
      ''SUPER, V, exec, rofi -modi clipboard:/etc/nixos/home-manager/modules/scripts/cliphist.sh -display-columns 2 -show clipboard -show-icons && wtype -p "$(wl-paste)"''

      "SUPER, Q, killactive,"
      "SUPER, P, pseudo,"

      "SUPER_SHIFT, I, togglesplit,"
      "SUPER, F, fullscreen,"
      "SUPER_SHIFT, F, togglefloating,"
      "SUPER_ALT, F, workspaceopt, allfloat"

      "SUPER_SHIFT, left, resizeactive, -10 0"
      "SUPER_SHIFT, right, resizeactive, 10 0"
      "SUPER_SHIFT, up, resizeactive, 0 -10"
      "SUPER_SHIFT, down, resizeactive, 0 10"

      "SUPER, left, movewindow, l"
      "SUPER, right, movewindow, r"
      "SUPER, up, movewindow, u"
      "SUPER, down, movewindow, d"

      "SUPER_SHIFT, h, movewindow, l"
      "SUPER_SHIFT, l, movewindow, r"
      "SUPER_SHIFT, k, movewindow, u"
      "SUPER_SHIFT, j, movewindow, d"

      "SUPER_ALT, left, swapwindow, l"
      "SUPER_ALT, right, swapwindow, r"
      "SUPER_ALT, up, swapwindow, u"
      "SUPER_ALT, down, swapwindow, d"

      "SUPER_ALT, 43, swapwindow, l"
      "SUPER_ALT, 46, swapwindow, r"
      "SUPER_ALT, 45, swapwindow, u"
      "SUPER_ALT, 44, swapwindow, d"

      "SUPER, h, movefocus, l"
      "SUPER, l, movefocus, r"
      "SUPER, k, movefocus, u"
      "SUPER, j, movefocus, d"

      "SUPER, 1, split-workspace, 1"
      "SUPER, 2, split-workspace, 2"
      "SUPER, 3, split-workspace, 3"
      "SUPER, 4, split-workspace, 4"

      "SUPER_SHIFT, SPACE, split-movetoworkspace, special"
      "SUPER, SPACE, togglespecialworkspace"

      "SUPER_SHIFT, 1, split-movetoworkspace, 1"
      "SUPER_SHIFT, 2, split-movetoworkspace, 2"
      "SUPER_SHIFT, 3, split-movetoworkspace, 3"
      "SUPER_SHIFT, 4, split-movetoworkspace, 4"

      "SUPER_CONTROL, right, split-workspace, +1"
      "SUPER_CONTROL, left, split-workspace, -1"
      "SUPER, mouse_down, split-workspace, +1"
      "SUPER, mouse_up, split-workspace, -1"

      "SUPER, Tab, split-cycleworkspaces, +1"
      "SUPER_SHIFT, Tab, split-cycleworkspaces, -1"

      "SUPER, U, split-changemonitor, +1"

      ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
