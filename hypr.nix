{ config, inputs, pkgs, ... }:
{
    services.dbus.enable = true;
    # Enable sound with pipewire.
    security.polkit.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        # alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        jack.enable = false;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        wireplumber.enable = true;
    };
    services.displayManager.enable = true;
    services.displayManager.defaultSession = "hyprland";
    security.pam.services.hyprlock = {};
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    xdg.portal = {
        enable = true;
        extraPortals = [ 
            pkgs.xdg-desktop-portal-hyprland
            # inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
            # pkgs.xdg-desktop-portal-wlr
            # pkgs.xdg-desktop-portal-gtk
        ];
        xdgOpenUsePortal = true;
    };
}