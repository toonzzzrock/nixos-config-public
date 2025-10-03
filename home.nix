{
  config,
  pkgs,
  lib,
  system,
  inputs,
  user,
  ...
}:

{
  home = {
    username = "toonzzzrock";
    homeDirectory = lib.mkForce "/home/toonzzzrock";
  };
  home.stateVersion = "24.11";

  home.file = {
    Public.source = config.lib.file.mkOutOfStoreSymlink "/run/media/toonzzzrock";
    ".config/nbfc.json".text = ''
      {
      "SelectedConfigId": "Acer Nitro AN515-47"
      }
    '';
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  imports = [
    ./home-manager/modules
    ./home-manager/home-packages.nix
  ];

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      package = pkgs.gnome-themes-extra;
      name = "adwaita-dark";
    };
  };

  dconf.settings = {

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # https://github.com/nix-community/home-manager/blob/master/modules/services/redshift-gammastep/lib/options.nix
  services.gammastep = {
    enable = true;
    # provider = "manual";
    # latitude = 13.74998;
    # longitude = 100.51682;
    dawnTime = "8:45-9:00";
    duskTime = "22:00-22:15";
    temperature = {
      day = 5500;
      night = 2500;
    };
  };

}
