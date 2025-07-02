{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        blur = {
          enabled = true;
        };
        shadow = {
          enabled = true;
        };
      };

      windowrulev2 = [
        "tag +file-manager, class:^([Ya]zi)$"
        "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$"
        "tag +projects, class:^(VSCode|code-url-handler|[Cc]ode|[Oo]bsidian|[Cc]odium|\\.zen-beta-wrapp|\\.zen-twilight-w|zen-twilight)$"
        "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"
        "tag +settings, class:^([Rr]ofi)$"
        "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "tag +settings, class:(nwg-displays)"
        "move 7% 7%,title:^(Picture-in-Picture)$"
        "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center, title:^(Authentication Required)$"
        "idleinhibit fullscreen, class:^(*)$"
        "idleinhibit fullscreen, title:^(*)$"
        "idleinhibit fullscreen, fullscreen:1"
        "float, tag:settings*"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(Authentication Required)$"
        "tile, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
        "float, initialTitle:(Add Folder to Workspace)"
        "float, initialTitle:(Open Files)"
        "float, initialTitle:(wants to save)"
        "size 70% 60%, initialTitle:(Open Files)"
        "size 70% 60%, initialTitle:(Add Folder to Workspace)"
        "size 70% 70%, tag:settings*"
        "opacity 0.8 0.8, tag:projects*"
        "opacity 0.8 0.86, tag:im*"
        "opacity 0.9 0.8, tag:file-manager*"
        "opacity 0.8 0.7, tag:terminal*"
        "opacity 0.7 0.7, tag:settings*"
        "opacity 0.95 0.75, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "keepaspectratio, title:^(Picture-in-Picture)$"
        "workspace special silent, tag:im*"
      ];
    };
  };
}
