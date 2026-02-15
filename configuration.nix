{
  pkgs,
  inputs,
  ...
}:
{
  nix.settings = {
    max-jobs = 2;
    cores = 4;
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./src/db.nix
    ./src/env.nix
    ./src/gpus.nix
    ./src/hardening.nix
    ./src/hypr.nix
    ./src/nbfc.nix
    ./src/network.nix
    ./src/power.nix
    ./src/programs.nix
    ./src/services.nix
    ./src/shell.nix
    ./src/sound.nix
    ./src/steam.nix
    ./src/virt.nix
  ];

  programs.zsh.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
  nix.settings.trusted-users = [
    "root"
    "toonzzzrock"
  ];
  users = {
    groups = {
      toonzzzrock = { };
      plugdev = { };
      wireshark = { };
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
        "wireshark"
      ];
      shell = pkgs.zsh;
    };
  };

  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
    inputs.antigravity-nix.overlays.default
    (final: prev: {
      vesktop = prev.vesktop.overrideAttrs (old: {
        preBuild = ''
          cp -r ${prev.electron.dist} electron-dist
          chmod -R u+w electron-dist
        '';
        buildPhase = ''
          runHook preBuild

          pnpm build
          pnpm exec electron-builder \
            --dir \
            -c.asarUnpack="**/*.node" \
            -c.electronDist="electron-dist" \
            -c.electronVersion=${prev.electron.version}

          runHook postBuild
        '';
      });
    })
  ];

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
  environment.systemPackages = import ./src/packages.nix { inherit pkgs inputs; };

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
