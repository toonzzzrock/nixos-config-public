{
  wayland.windowManager.hyprland.settings = {
    # name "Dynamic"
    # credit https://github.com/mylinuxforwork/dotfiles 
    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];
      animation = [
        "windows, 1, 3, wind, slide" # Reduced duration
        "windowsIn, 1, 3, winIn, slide" # Reduced duration
        "windowsOut, 1, 2.5, winOut, slide" # Reduced duration
        "windowsMove, 1, 2.5, wind, slide" # Reduced duration
        "border, 0, 0.5, liner" # Reduced duration
        "borderangle, 0, 15, liner, once" # Reduced duration
        "fade, 0, 5, default" # Reduced duration
        "workspaces, 1, 2.5, wind" # Reduced duration
      ];
    };
  };
}
