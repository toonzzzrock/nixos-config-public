let animChoice = ./animations-def.nix;
in {
  imports = [
    # animChoice
    ./binds.nix
    ./hyprland.nix
    ./pyprland.nix
    ./windowrules.nix
    ./animations-dynamic.nix
  ];
}
