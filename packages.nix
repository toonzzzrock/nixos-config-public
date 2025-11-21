{ pkgs, ... }:
with pkgs;
[
  lazydocker

  dbeaver-bin
  zoom-us
  godot
  brightnessctl
  gimp
  nix-search-cli

  brave
  dig
  xfce.thunar

  llvmPackages_21.llvm # core LLVM tools like opt, llc
  llvmPackages_21.clang # C/C++/Objective‑C compiler front end
  llvmPackages_21.lld # LLVM linker
  llvmPackages_21.lldb # debugger

  youtube-music
  nixfmt

  protonup-ng
  # hyprpaper
  nbfc-linux

  # vdpauinfo
  # libva-utils
  # nvidia-vaapi-driver

  # rclone

  ncdu
  nwg-displays
  bluetuith
  slurp
  xdg-utils
  gzip
  zip
  unzip
  # xdg-desktop-portal-hyprland
  # xdg-desktop-portal-gtk
  qimgv # Image Viewer
  hyprpolkitagent
  cliphist # Clipboard manager using rofi menu
  wl-clipboard
  hyprpicker # Color Picker
  hyprshot
  playerctl
  brightnessctl
  kitty-themes

  obs-studio

  vial
  qmk-udev-rules # the only relevant

  obsidian
  networkmanagerapplet
  # pkgs.x86_64_v4.vesktop
  vesktop

  # discord-canary
  #  vscode

  fastfetch
  eza # Beautiful ls Replacement
  killall # For Killing All Instances Of Programs
  mpv # Incredible Video Player
  pavucontrol # For Editing Audio Levels & Devices
  btop
  yazi # TUI File Manager
  nodejs
  fastfetch
  cava
  # neovim
  ripgrep
  fzf
  zsh-powerlevel10k # ZSH Theme
  git
  gh
  grim
  jq

]
