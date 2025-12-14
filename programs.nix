{ pkgs, ... }:
{
  # Enable Zoom application
  programs.zoom-us.enable = true;

  # Vial keyboard firmware tool and QMK udev rules
  services.udev.packages = with pkgs; [
    vial
    qmk-udev-rules # the only relevant
  ];
}
