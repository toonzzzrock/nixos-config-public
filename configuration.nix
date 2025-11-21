{
  pkgs,
  lib,
  ...
}:
{
  nix.settings = {
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
    ./hardening.nix
    ./gpus.nix
    ./hypr.nix
    ./power.nix
    ./shell.nix
    # ./nvim.nix
    ./life_archive.nix
    # ./rclone.nix
    ./steam.nix
    ./network.nix
    ./nbfc.nix
  ];

  services.pulseaudio.support32Bit = lib.mkForce false;
  services.pipewire.alsa.support32Bit = lib.mkForce false;
  services.jack.alsa.support32Bit = lib.mkForce false;
  hardware.graphics.enable32Bit = lib.mkForce false;

  qt = {
    enable = true;
    style = "adwaita-dark";
  };

  services.das_watchdog.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
  services.blueman.enable = false;
  # auto mounting USB drives
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.avahi.enable = false;
  services.flatpak.enable = false;

  services.httpd.enablePerl = false;

  environment = {
    # Perl is a default package.
    defaultPackages = lib.mkForce [ ];
    stub-ld.enable = lib.mkForce false;
    # "https://gist.github.com/kRHYME7/1d2574e8f3a4b7ad4059535503ce1eaa"
    sessionVariables = rec {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/toonzzzrock/.steam/root/compatibilitytools.d";
      WAYLAND_DISPLAY = "wayland-1";
      NIXOS_OZONE_WL = 1;
      GTK_USE_PORTAL = 0;
      MOZ_ENABLE_WAYLAND = 1;
      ELECTRON_ENABLE_WAYLAND = 1;
      MOZ_DISABLE_RDD_SANDBOX = 1;
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      NIXPKGS_ALLOW_UNFREE = 1;
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      BROWSER = "zen";
      TERMINAL = "kitty";
      HYPRSHOT_DIR = "/home/toonzzzrock/Pictures/Screenshots";
      LIBVA_DRIVER_NAME = "nvidia"; # iHD
      VDPAU_DRIVER = "nvidia"; # va_gl

      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
      __GL_GSYNC_ALLOWED = 1;
      __GL_MaxFramesAllowed = 1;
      __GL_VRR_ALLOWED = 0;
      PROTON_ENABLE_NGX_UPDATER = 1;
      # __NV_PRIME_RENDER_OFFLOAD = "1";
      NVD_BACKEND = "direct";

      GDK_BACKEND = "wayland, x11";
      CLUTTER_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      SDL_VIDEODRIVER = "wayland";
      DISPLAY = ":0";

      EGL_PLATFORM = "wayland";
      GSK_RENDERER = "gl";
      EDITOR = "code";
      SUDO_EDITOR = "nvim";
      MAMBA_ROOT_PREFIX = "/home/toonzzzrock/.mamba/";
    };
  };

  programs = {
    # The lessopen package pulls in Perl.
    less.lessopen = lib.mkForce null;
    command-not-found.enable = lib.mkForce false;
    fish.generateCompletions = lib.mkForce false;
    nano.enable = false;
    zoom-us.enable = true;
  };
  services.upower.enable = true;
  services.hardware.bolt.enable = false;

  # Docker
  virtualisation = {
    docker.enable = true;
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
  systemd.services.container.wantedBy = lib.mkForce [ ];

  hardware.nvidia-container-toolkit.enable = true;

  services.geoclue2.enable = false;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  services.printing.enable = false;
  services.system-config-printer.enable = false;
  services.printing.webInterface = false;

  services.wyoming.satellite.vad.enable = false;
  services.speechd.enable = false;

  programs.zsh.enable = true;
  nix.settings.trusted-users = [
    "root"
    "toonzzzrock"
  ];
  users.users.toonzzzrock = {
    isNormalUser = true;
    description = "toonzzzrock";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "sound"
      "video"
      "tty"
      "dialout"
      "input"
      "storage"
      "docker"
    ];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;
  users.groups.toonzzzrock = { };

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

  systemd.services.systemd-udev-settle.enable = false;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;
  # List packages installed in system profile. To search, run:
  environment.systemPackages = import ./packages.nix { inherit pkgs; };

  services.udev.packages = with pkgs; [
    vial
    qmk-udev-rules # the only relevant
  ];
  # programs.zoom-us.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  systemd.services.mysql.wantedBy = lib.mkForce [ ];

  services.journald.extraConfig = "Storage=none";

  systemd.services.systemd-journal-flush.enable = false;

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = false;
    enableDefaultPackages = true;
    packages = with pkgs; [
      # hack-font
      # jetbrains-mono
      # liberation_ttf
      # monaspace
      # noto-fonts
      nerd-fonts.jetbrains-mono
    ];
  };

  system.stateVersion = "24.11";

}
