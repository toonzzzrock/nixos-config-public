{
  wayland.windowManager.hyprland = {
    settings = {

      windowrulev2 = [
        "tag +file-manager, class:^([Ya]zi)$"
        "tag +terminal, class:^(Alacritty|kitty|kitty-dropterm)$"
        "tag +projects, class:^(VSCode|code-url-handler|[Cc]ode|[Oo]bsidian|[Cc]odium)$"
        "tag +browser, class:^(\\.zen-beta-wrapp|\\.zen-twilight-w|zen-twilight|zen)$"
        "tag +im, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"
        "tag +music, class:^(Spotify|[Mm]elody|com\\.github\\.th_ch\\.youtube_music)$"
        "tag +obs, class:^([Oo]bsidian)$"
        "tag +settings, class:^([Rr]ofi)$"
        "tag +settings, class:^(nm-applet|nm-connection-editor|blueman-manager)$"
        "tag +settings, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "tag +settings, class:(nwg-displays)"
        "move 7% 7%,title:^(Picture-in-Picture)$"
        "center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center, title:^(Authentication Required)$"
        "idleinhibit fullscreen, class:^(btop)$"
        "size 100% 100%, class:^(btop)$"
        "float, tag:settings*"
        "fullscreen, title:^(btop)$"
        "float, title:^(Picture-in-Picture)$"
        "float, title:^(Authentication Required)$"
        "tile, class:(codium|codium-url-handler|VSCodium), title:negative:(.*codium.*|.*VSCodium.*)"
        "float, initialTitle:(Add Folder to Workspace)"
        "float, initialTitle:(Open Files)"
        "float, initialTitle:(wants to save)"
        "size 70% 60%, initialTitle:(Open Files)"
        "size 70% 60%, initialTitle:(Add Folder to Workspace)"
        "size 70% 70%, tag:settings*"
        "opacity 0.8 0.8 0.9, tag:projects*"
        "opacity 0.7 0.7 0.9, tag:music*"
        "opacity 1.0 1.0 1.0, tag:browser*"
        "opacity 0.8 0.8 1.0, tag:im*"
        "opacity 0.8 0.8 0.8, tag:file-manager*"
        "opacity 0.8 0.8 0.8, tag:terminal*"
        "opacity 0.8 0.8 0.8, tag:settings*"
        "opacity 1.0 1.0 1.0, initialTitle:(Discord Popout)"
        "pin, title:^(Picture-in-Picture)$"
        "keepaspectratio, title:^(Picture-in-Picture)$"
        "workspace special silent, tag:obs*"
      ];
    };
  };
}
