{
  wayland.windowManager.hyprland = {
    settings = {
      # According to the Hyprland Wiki, updated syntax uses 'match:' properties
      # and supports tagging for grouping rules.
      windowrule = [
        # --- Tags (Defining Rules) ---
        "tag +file-manager, match:class ^([Ya]zi)$"
        "tag +terminal, match:class ^(Alacritty|kitty|kitty-dropterm)$"
        "tag +projects, match:class ^(VSCode|code-url-handler|[Cc]ode|[Oo]bsidian|[Cc]odium)$"
        "tag +browser, match:class ^(\\.zen-beta-wrapp|\\.zen-twilight-w|zen-twilight|zen)$"
        "tag +im, match:class ^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"
        "tag +music, match:class ^(Spotify|[Mm]elody|com\\.github\\.th_ch\\.youtube_music)$"
        "tag +obs, match:class ^([Oo]bsidian)$"
        "tag +settings, match:class ^([Rr]ofi)$"
        "tag +settings, match:class ^(nm-applet|nm-connection-editor|blueman-manager)$"
        "tag +settings, match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "tag +settings, match:class (nwg-displays)"

        # --- Layout & Position Rules ---
        "move 7% 7%, match:title ^(Picture-in-Picture)$"
        "center on, match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center on, match:title ^(Authentication Required)$"
        "float on, match:tag settings*"
        "float on, match:tag terminal*"
        "float on, match:title ^(Picture-in-Picture)$"
        "float on, match:title ^(Authentication Required)$"
        "tile on, match:class (codium|codium-url-handler|VSCodium), match:title negative:(.*codium.*|.*VSCodium.*)"

        # --- Window State Rules ---
        "idle_inhibit fullscreen, match:class ^(btop)$"
        "fullscreen on, match:class ^(btop)$"
        "fullscreen on, match:title ^(btop)$"
        "size 100% 100%, match:class ^(btop)$"
        "pin on, match:title ^(Picture-in-Picture)$"
        "keep_aspect_ratio on, match:title ^(Picture-in-Picture)$"

        # --- Size Rules ---
        "size 100% 100%, match:class ^(btop)$"
        "size 70% 60%, match:initial_title (Open Files)"
        "size 70% 60%, match:initial_title (Add Folder to Workspace)"
        "size 70% 70%, match:tag settings*"

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
        "opacity 0.8 0.8 0.8, match:tag terminal*"
        "opacity 0.8 0.8 0.8, match:tag settings*"
        "opacity 1.0 1.0 1.0, match:initial_title (Discord Popout)"

        # --- Workspaces ---
        "workspace special silent, match:tag obs*"
      ];
    };
  };
}
