{
  inputs,
  pkgs,
  ...
}:
{

  services.xserver = {
    enable = true; # Disable X11
    videoDrivers = [
      "nvidia"
      "modesetting"
      "i915"
    ];
    exportConfiguration = true;
  };

  services.displayManager = {
    enable = true;
    defaultSession = "hyprland";
    autoLogin.enable = true;
    autoLogin.user = "toonzzzrock";
  };

  services.dbus.enable = true;

  security.pam.services.hyprlock = { };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
  xdg.portal = {
    enable = true;
    config.common.default = [
      "hyprland"
      "gtk"
    ];
    extraPortals = [
      # pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = false;
    config.hyprland = {
      "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
    };
  };

}
