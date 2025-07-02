{ pkgs, ... }:
with pkgs; [
    obsidian
    # xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    discord-canary
    fastfetch
    fzf
    kitty
    hyprpolkitagent
    qdirstat
    acpi
    # appimage-run # Needed For AppImage Support
    brightnessctl # For Screen Brightness Control
    cliphist  # Clipboard manager using rofi menu
    # duf # Utility For Viewing Disk Usage In Terminal
    eza # Beautiful ls Replacement
    # ffmpeg # Terminal Video / Audio Editing
    # file-roller # Archive Manager
    obsidian
    # gedit # Simple Graphical Text Editor
    # gimp # Great Photo Editor
    # glxinfo  #needed for inxi diag util
    # greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    # htop # Simple Terminal Based System Monitor
    hyprpicker # Color Picker
    eog # For Image Viewing
    # inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    # libnotify # For Notifications
    # lm_sensors # Used For Getting Hardware Temps
    # lolcat # Add Colors To Your Terminal Command Output
    # lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    # ncdu # Disk Usage Analyzer With Ncurses Interface
    # nixfmt-rfc-style # Nix Formatter
    # nwg-displays  #configure monitor configs via GUI
    # onefetch #provides zsaneyos build info on current system
    pavucontrol # For Editing Audio Levels & Devices
    # pciutils # Collection Of Tools For Inspecting PCI Devices
    # picard # For Changing Music Metadata & Getting Cover Art
    # pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    # playerctl # Allows Changing Media Volume Through Scripts
    # rhythmbox
    # powertop
    # socat # Needed For Screenshots
    # usbutils # Good Tools For USB Devices
    # v4l-utils # Used For Things Like OBS Virtual Camera
    wget # Tool For Fetching Files With Links
    yazi #TUI File Manager
    # ytmdl # Tool For Downloading Audio From YouTube

    # brave
    # catch2
    # cmake
    # gcc
    # clang
    # llvmPackages.clang
    # zig

    zip
    unzip
    unrar # Tool For Handling .rar Files
    xz
    p7zip
    # oh-my-zsh
    # oh-my-posh

    btop
    ripgrep
    
    /* obsidian */
    # WM stuff
    # libsForQt5.xwaylandvideobridge
    libnotify

    nodejs
    
    fastfetch
    neovim
    cava
    networkmanagerapplet

    gparted
    lshw

    # # kando
    # # gnomeExtensions.kando-integration
    fzf

    kitty
    vscode
    
    zsh-powerlevel10k # ZSH Theme
    git
    gh

    # inputs.zen-browser.packages.${system}.twilight

    hyprshot
    swww
    grim
    slurp
    wl-clipboard
    wtype
    swappy
    ydotool
    hyprpolkitagent
    wlogout
    playerctl
    # xfce.xfce4-power-manager  # Add power manager to packages

    jq
    bc
    zsh-vi-mode
    zsh-fzf-history-search
    zsh-fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
    coreutils 
]


