{
  config,
  inputs,
  pkgs,
  lib,
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

    # # https://nixos.wiki/wiki/PipeWire#Advanced_Configuration
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 128;
        "default.clock.max-quantum" = 2048;
      };
    };
    # "As a general rule, the values in pipewire-pulse should not
    # be lower than the ones in pipewire."
    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "512/48000";
            pulse.default.req = "512/48000";
            pulse.max.req = "512/48000";
            pulse.min.quantum = "128/48000";
            pulse.max.quantum = "2048/48000";
          };
        }
      ];
      stream.properties = {
        node.latency = "512/48000";
        resample.quality = 1;
      };
    };
  };

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
