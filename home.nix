{ config, pkgs, lib, system, inputs, user, ... }:

{
  home = {
    username 	= "toonzzzrock";
    homeDirectory = lib.mkForce "/home/toonzzzrock";
  };
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  imports = [
    ./home-manager/modules
    ./home-manager/home-packages.nix
  ];
}


