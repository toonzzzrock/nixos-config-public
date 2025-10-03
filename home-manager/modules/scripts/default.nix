{ pkgs, username, ... }: {
  home.packages = [
    (import ./keybinds.nix { inherit pkgs; })
    (import ./task-waybar.nix { inherit pkgs; })
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ./web-search.nix { inherit pkgs; })
    (import ./rofi-launcher.nix { inherit pkgs; })
    (import ./hypr-shutdown.nix { inherit pkgs; })
    (import ./hypr-reboot.nix { inherit pkgs; })
    (import ./life_archive.nix { inherit pkgs; })
    (import ./life_archive_toggle.nix { inherit pkgs; })
    (import ./hypr-start.nix { inherit pkgs; })
    (import ./memorize.nix { inherit pkgs; })
  ];
}
