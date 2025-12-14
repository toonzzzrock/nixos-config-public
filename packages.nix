{
  pkgs,
  inputs,
  ...
}:
with pkgs;
[
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

  # Hyprland and related packages
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
  hyprpolkitagent
  inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default

  # image tools
  imv
  qimgv # Image Viewer
  glib
  mpv
  gimp

  # winboat
  freerdp
  winboat

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
  xfce.thunar
  youtube-music
  obsidian

  # Development tools
  llvmPackages_21.llvm # core LLVM tools like opt, llc
  llvmPackages_21.clang # C/C++/Objective‑C compiler front end
  llvmPackages_21.lld # LLVM linker
  llvmPackages_21.lldb # debugger
  nixfmt
  nodejs
  rust-bin.stable.latest.default
  gcc # provides `cc`
  pkg-config # helps native deps find headers/libs
  rust-analyzer
  rustc
  cargo
  rustfmt
  cmake
  clippy
  inputs.nil.packages.${pkgs.stdenv.hostPlatform.system}.nil

  # Gaming tools
  protonup-ng

  # Command line tools
  dig
  ncdu
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
  yazi # TUI File Manager
  pavucontrol # For Editing Audio Levels & Devices
  nbfc-linux
  bluetuith
  slurp
  playerctl
  kitty-themes
  networkmanagerapplet
  (inputs.nvf.lib.neovimConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./nvim.nix
    ];
  }).neovim
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
