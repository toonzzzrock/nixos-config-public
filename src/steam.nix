{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;

    gamescopeSession = {
      enable = true;
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      libkrb5
      keyutils
      protonup-qt
    ];
  };
  programs.gamescope = {
    enable = true;
    capSysNice = true;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };
  programs.gamemode.enable = true;
}
