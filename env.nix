{ lib, pkgs, ... }:
{
  qt = {
    enable = true;
    style = "adwaita-dark";
  };

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
      BROWSER = "zen-twilight";
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
      DETSYS_IDS_TELEMETRY = "disabled";
      NEXT_TELEMETRY_DISABLED = 1;
      DOTNET_CLI_TELEMETRY_OPTOUT = 1;

      PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
      PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
      PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    };
  };
}
