{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "ALT, Space, exec,rofi-launcher"

      "$modifier SHIFT,V, exec, memorize"
      "$modifier ALT,W, exec,wallsetter"
      "$modifier,W,exec, nvidia-offload zen"
      "$modifier SHIFT,W, exec, nvidia-offload brave"
      "$modifier,C,exec, nvidia-offload code"
      "$modifier,O,exec, nvidia-offload obsidian"
      "$modifier,Z,exec, nvidia-offload zoom"
      "$modifier SHIFT,C,exec,kitty -e nvim"
      "$modifier, B,exec,kitty -e bluetuith"
      "$modifier,D,exec, vesktop --enable-features=WebRTCPipeWireCapturer, WebRtcPipeWireCamera"

      "$modifier,Y,exec,kitty -e yazi"
      "$modifier,N,exec,kitty -e nmtui"
      "$modifier,M,exec,nvidia-offload youtube-music"
      "$modifier SHIFT,M,exec,kitty -e cava"
      "$modifier ALT,M,exec,pavucontrol"

      "$modifier,S,exec,hyprshot -m window"
      "$modifier SHIFT,S,exec,hyprshot -m output"
      "$modifier ALT,S,exec,hyprshot -m region"

      "$modifier ALT,C,exec,hyprpicker -a"
      "$modifier,T,exec,pypr toggle term"
      "$modifier SHIFT,T,exec, kitty -e sudo btop"
      ''$modifier,V,exec, rofi -modi clipboard:/etc/nixos/home-manager/modules/scripts/cliphist.sh -display-columns 2 -show clipboard -show-icons && wtype -p "$(wl-paste)"''

      "$modifier,Q,killactive,"
      "$modifier,P,pseudo,"

      "$modifier SHIFT,I,togglesplit,"
      "$modifier,F,fullscreen,"
      "$modifier SHIFT,F,togglefloating,"
      "$modifier ALT,F,workspaceopt, allfloat"

      "$modifier SHIFT,left,resizeactive, -10 0"
      "$modifier SHIFT,right,resizeactive, 10 0"
      "$modifier SHIFT,up,resizeactive, 0 -10"
      "$modifier SHIFT,down,resizeactive, 0 10"

      "$modifier,left,movewindow,l"
      "$modifier,right,movewindow,r"
      "$modifier,up,movewindow,u"
      "$modifier,down,movewindow,d"

      "$modifier SHIFT,h,movewindow,l"
      "$modifier SHIFT,l,movewindow,r"
      "$modifier SHIFT,k,movewindow,u"
      "$modifier SHIFT,j,movewindow,d"

      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"

      "$modifier ALT, 43, swapwindow,l"
      "$modifier ALT, 46, swapwindow,r"
      "$modifier ALT, 45, swapwindow,u"
      "$modifier ALT, 44, swapwindow,d"

      "$modifier,h,movefocus,l"
      "$modifier,l,movefocus,r"
      "$modifier,k,movefocus,u"
      "$modifier,j,movefocus,d"

      "$modifier,1,split-workspace,1"
      "$modifier,2,split-workspace,2"
      "$modifier,3,split-workspace,3"
      "$modifier,4,split-workspace,4"

      "$modifier SHIFT,SPACE,split-movetoworkspace,special"
      "$modifier,SPACE,togglespecialworkspace"

      "$modifier SHIFT,1,split-movetoworkspace,1"
      "$modifier SHIFT,2,split-movetoworkspace,2"
      "$modifier SHIFT,3,split-movetoworkspace,3"
      "$modifier SHIFT,4,split-movetoworkspace,4"

      "$modifier CONTROL,right,split-workspace,+1"
      "$modifier CONTROL,left,split-workspace,-1"
      "$modifier,mouse_down,split-workspace,+1"
      "$modifier,mouse_up,split-workspace,-1"

      "$modifier,Tab,split-cycleworkspaces, +1"
      "$modifier SHIFT,Tab,split-cycleworkspaces, -1"

      "$modifier,U,split-changemonitor, +1"

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
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
