{
  pkgs,
  inputs,
  ...
}:
with pkgs;
[
  # file system tools
  btrfs-assistant
  snapper
  btdu

  # security tools
  amass
  subfinder
  whois
  nmap
  wireshark
  sqlmap
  nikto
  burpsuite
  exiftool
  net-tools

  # Hyprland and related packages
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
  hyprpolkitagent
  inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
  easyeffects

  # image tools
  imv
  qimgv # Image Viewer
  glib
  mpv
  gimp

  # Vertualization and gaming tools
  vulkan-tools
  freerdp
  winetricks
  # wineWowPackages.staging
  wine

  # container tools
  lazydocker

  # DB tools
  dbeaver-bin

  # Media tools
  obs-studio
  vesktop

  # 3D and game development
  blender
  godot

  # Browsers and note taking
  brave
  thunar
  pear-desktop
  obsidian

  # Formatting tools
  nixfmt
  pkg-config
  inputs.nil.packages.${pkgs.stdenv.hostPlatform.system}.nil

  # Gaming tools
  protonup-ng

  # Command line tools
  pavucontrol
  dig
  xdg-utils
  gzip
  zip
  unzip
  fastfetch
  eza # Beautiful ls Replacement
  killall # For Killing All Instances Of Programs
  btop
  fastfetch
  cava
  ripgrep
  fzf
  zsh-powerlevel10k # ZSH Theme
  git

  # Utilities
  ncdu
  yazi # TUI File Manager
  pavucontrol # For Editing Audio Levels & Devices
  nbfc-linux
  bluetuith
  slurp
  playerctl
  kitty-themes
  networkmanagerapplet
  libreoffice-fresh

  # IDE
  (inputs.nvf.lib.neovimConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./nvim.nix
    ];
  }).neovim
  google-antigravity

  ## Monitor
  nwg-displays
  brightnessctl

  ## Clipboard managers and screenshot tools
  cliphist # Clipboard manager using rofi menu
  wl-clipboard
  hyprpicker # Color Picker
  hyprshot
  grim
  gh
  jq

  # QMK
  vial
  qmk-udev-rules # the only relevant

]
