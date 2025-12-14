{
  wayland.windowManager.hyprland = {
    settings = {
      # According to the Hyprland Wiki, updated syntax uses 'match:' properties
      # and supports tagging for grouping rules.
      windowrulev2 = [
        "keepaspectratio, title:^(Picture-in-Picture)$"
      ];
      windowrule = [
        # --- Tags (Defining Rules) ---
        "tag +file-manager, match:class ^([y]azi|Thunar|[Bb]top)$"
        "tag +projects, match:class ^(VSCode|code-url-handler|[Cc]ode|[Oo]bsidian|[Cc]odium)$"
        "tag +browser, match:class ^(\\.zen-beta-wrapp|\\.zen-twilight-w|zen-twilight|zen)$"
        "tag +im, match:class ^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"
        "tag +music, match:class ^(Spotify|[Mm]elody|com\\.github\\.th_ch\\.youtube_music)$"
        "tag +obs, match:class ^([Oo]bsidian)$"

        # --- Layout & Position Rules ---
        "center on, match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center on, match:title ^(Authentication Required)$"
        "float on, match:title ^(Authentication Required)$"
        "tile on, match:class (codium|codium-url-handler|VSCodium), match:title negative:(.*codium.*|.*VSCodium.*)"

        # --- Window State Rules ---
        "pin on, match:class ^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"

        # --- Size Rules ---
        "size 70% 60%, match:initial_title (Open Files)"
        "size 70% 60%, match:initial_title (Add Folder to Workspace)"

        # --- Floating Dialogs (using initial_title) ---
        "float on, match:initial_title (Add Folder to Workspace)"
        "float on, match:initial_title (Open Files)"
        "float on, match:initial_title (wants to save)"

        # --- Appearance (Opacity) Rules using Tags ---
        "opacity 0.8 0.8 0.9, match:tag projects*"
        "opacity 0.7 0.7 0.9, match:tag music*"
        "opacity 1.0 1.0 1.0, match:tag browser*"
        "opacity 0.8 0.8 1.0, match:tag im*"
        "opacity 0.8 0.8 0.8, match:tag file-manager*"
        "opacity 1.0 1.0 1.0, match:initial_title (Discord Popout)"

        "tag +tui, match:class ^([Rr]ofi|nm-applet|nm-connection-editor|blueman-manager|pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol|nwg-displays)"
        "tag +tui, match:class ^kitty$, match:initial_title ^kitty$, match:initial_class ^kitty$"
        "float on, match:tag tui*"
        "center on, match:tag tui*"
        "size 1000 800, match:tag tui*"
        "opacity 0.8 0.8 0.8, match:tag tui*"

        # --- Workspaces ---
        "workspace special silent, match:tag obs*"

        "tag +terminal, match:class ^(kitty-dropterm)$"
        "float on, match:tag terminal*"
        "center on, match:tag terminal*"

        "pin on, match:title ^(Picture-in-Picture)$"
        "float on, match:title ^(Picture-in-Picture)$"
        "move 1300 700, match:title ^(Picture-in-Picture)$"
        "size 240 135, match:title ^(Picture-in-Picture)$"

      ];
    };

  };
}
