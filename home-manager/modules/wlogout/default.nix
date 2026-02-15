# ~/nixos/home/programs/wlogout/default.nix
# https://github.com/HyDE-Project/HyDE/blob/master/Configs/.config/wlogout/style_2.css
{
  lib,
  ...
}:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "reboot";
        action = "hypr-reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "hypr-shutdown";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
    ];
    style = lib.mkForce (builtins.readFile ./style.css);
  };
}
