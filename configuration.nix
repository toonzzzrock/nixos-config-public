# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
	[ # Include the results of the hardware scan.
  	./hardware-configuration.nix
    ./stylix.nix
    ./gpus.nix
    ./hypr.nix
    ./power.nix
    ./shell.nix
	];
  environment.defaultPackages = [];
  services.gnome.core-apps.enable = false;
  programs.nano.enable = false;
  hardware.bluetooth.enable = true;
  services.hardware.bolt.enable = false;
  services.system-config-printer.enable = false;
  services.geoclue2.enable = false;
  services.xserver.desktopManager.xterm.enable = false; 
  services.wyoming.satellite.vad.enable = false;
  services.speechd.enable = false;

  programs.zsh.enable = true;
  users.users.toonzzzrock = {
    isNormalUser = true;
    description = "toonzzzrock";
    extraGroups = ["networkmanager" "wheel" "audio" "sound" "video" "tty" "dialout" "input"];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;
  users.groups.toonzzzrock = {};

  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  # services.fwupd.enable = true;

  # Enable networking
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    # useDHCP = false;
    enableIPv6 = true;
    modemmanager.enable = false;
    usePredictableInterfaceNames = false;
    # dhcpcd.enable = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  };
  services.resolved.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
	LC_ADDRESS = "th_TH.UTF-8";
	LC_IDENTIFICATION = "th_TH.UTF-8";
	LC_MEASUREMENT = "th_TH.UTF-8";
	LC_MONETARY = "th_TH.UTF-8";
	LC_NAME = "th_TH.UTF-8";
	LC_NUMERIC = "th_TH.UTF-8";
	LC_PAPER = "th_TH.UTF-8";
	LC_TELEPHONE = "th_TH.UTF-8";
	LC_TIME = "th_TH.UTF-8";
  };

  services.accounts-daemon.enable = true;
  services.xserver = {
    enable = true;
    # defaultDepth = 24;
    # videoDriver = "intel";
    exportConfiguration = true;
    enableTCP = true;
    displayManager.gdm.wayland = true;
    displayManager.gdm.enable = true;
  };

  services.smartd = {
    enable = false;
    devices = [
      {
        device = "/dev/disk/by-uuid/a0bf9745-e759-4cdd-a267-74412bedf27e";
      }
    ];
  };

  # # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "toonzzzrock";


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };
  services.preload = {
    enable = true;
  };


  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  
  services.journald.extraConfig = "SystemMaxUse=1M";
  systemd.services.systemd-journal-flush.enable = false;

  systemd.extraConfig = ''
  DefaultTimeoutStopSec=1s
  DefaultLimitNOFILE=4096'';

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      hack-font
      jetbrains-mono
      liberation_ttf
      monaspace
      noto-fonts
      nerd-fonts.jetbrains-mono
    ];
  };



  system.stateVersion = "24.11"; 
}


