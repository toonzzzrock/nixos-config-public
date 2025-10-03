{ pkgs, ... }:
pkgs.writeShellScriptBin "wallsetter" ''

  TIMEOUT=720

  for pid in $(pidof -o %PPID -x wallsetter); do
    kill $pid
  done
  WALLPAPER_DIR="/etc/nixos/wallpapers"
  CURRENT_WALL=$(hyprctl hyprpaper listloaded)

  while true; do
    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
    # Apply the selected wallpaper
    hyprctl hyprpaper reload ,"$WALLPAPER"
    sleep $TIMEOUT
  done
''
