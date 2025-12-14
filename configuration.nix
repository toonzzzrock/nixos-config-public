{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  nix.settings = {
    max-jobs = 2;
    cores = 4;
    substituters = [
      "https://hyprland.cachix.org"
      "https://install.determinate.systems"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://install.determinate.systems"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
    ];
  };

  imports = [
    # Include the results of the hardware scan.
    ./env.nix
    ./db.nix
    ./gpus.nix
    ./hardening.nix
    ./hardware-configuration.nix
    ./hypr.nix
    ./life_archive.nix
    ./nbfc.nix
    ./network.nix
    ./power.nix
    ./programs.nix
    ./services.nix
    ./shell.nix
    ./steam.nix
    ./virt.nix
  ];

  programs.zsh.enable = true;
  nix.settings.trusted-users = [
    "root"
    "toonzzzrock"
  ];
  users = {
    groups = {
      toonzzzrock = { };
      plugdev = { };
    };
    users.toonzzzrock = {
      isNormalUser = true;
      description = "toonzzzrock";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "video"
        "tty"
        "dialout"
        "input"
        "docker"
        "plugdev"
        "libvirtd"
        "kvm"
      ];
      shell = pkgs.zsh;
    };
  };
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "th_TH.UTF-8";
    LC_MONETARY = "th_TH.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "th_TH.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  # List packages installed in system profile. To search, run:
  environment.systemPackages = import ./packages.nix { inherit pkgs inputs; };

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = false;
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };

  system.stateVersion = "24.11";

}
