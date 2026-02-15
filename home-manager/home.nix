{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = "toonzzzrock";
    homeDirectory = lib.mkForce "/home/toonzzzrock";
    stateVersion = "24.11";

    file = {
      Public.source = config.lib.file.mkOutOfStoreSymlink "/run/media/toonzzzrock";
      ".config/nbfc.json".text = ''
        {
        "SelectedConfigId": "Acer Nitro AN515-47"
        }
      '';
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "JetBrains Mono";
      size = 11;
    };
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}
