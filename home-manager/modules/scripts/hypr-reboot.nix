{ pkgs }:

pkgs.writeShellScriptBin "hypr-reboot" ''
 # close all client windows
# required for graceful exit since many apps aren't good SIGNAL citizens
HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
hyprctl --batch "$HYPRCMDS" >> /tmp/hypr/hyprexitwithgrace.log 2>&1

# try to defer a system shutdown
# ( sleep 2; sudo shutdown now ) &  # doesn't work bc bg process is child of hyprland and will get killed with parent
# f*!* it, just shutdown now
sudo systemctl reboot now >> /tmp/hypr/hyprexitwithgrace.log 2>&1
''