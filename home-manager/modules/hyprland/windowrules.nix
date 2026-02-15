{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        # --- Tags (Defining Rules) ---
        "tag +file-manager, match:class ^([y]azi|Thunar|[Bb]top)$"
        "tag +projects, match:class ^(VSCode|code-url-handler|[Cc]ode|[Oo]bsidian|[Cc]odium|[Aa]ntigravity)$"
        "tag +browser, match:class ^(\\.zen-beta-wrapp|\\.zen-twilight-w|zen-twilight|zen)$"
        "tag +im, match:class ^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Dd]iscord[Cc]anary)$"
        "tag +music, match:class ^(Spotify|[Mm]elody|com\\.github\\.th_ch\\.youtube_music)$"
        "tag +obs, match:class ^([Oo]bsidian)$"
        "tag +pip, match:title ^(?:[Pp]icture(?:-| )in(?:-| )[Pp]icture)$"

        # --- Layout & Position Rules ---
        "center on, match:class ^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"
        "center on, match:title ^(Authentication Required)$"
        "float on, match:title ^(Authentication Required)$"

        # --- Window State Rules ---
        "pin on, match:tag im*"

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
        "opacity 0.7 0.7 0.8, match:tag tui*"

        # --- Workspaces ---
        "workspace special silent, match:tag obs*"

        "tag +terminal, match:class ^(kitty-dropterm)$"
        "float on, match:tag terminal*"
        "center on, match:tag terminal*"

        "keep_aspect_ratio on, match:tag pip*"

        # Accept either "Picture in Picture" or "Picture-in-Picture"
        "pin on, match:tag pip*"
        "float on, match:tag pip*"
        "move 1300 700, match:tag pip*"
        "size 240 135, match:tag pip*"
        "size 1500 800, match:tag tui*"
      ];
    };
  };
}
