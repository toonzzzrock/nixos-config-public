{
  config,
  pkgs,
  ...
}:
let
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nvidia-x11/default.nix
  # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #   version = "580.95.05";
  #   sha256_64bit = "sha256-hJ7w746EK5gGss3p8RwTA9VPGpp2lGfk5dlhsv4Rgqc=";
  #   sha256_aarch64 = "sha256-zLRCbpiik2fGDa+d80wqV3ZV1U1b4lRjzNQJsLLlICk=";
  #   openSha256 = "sha256-RFwDGQOi9jVngVONCOB5m/IYKZIeGEle7h0+0yGnBEI=";
  #   settingsSha256 = "sha256-F2wmUEaRrpR1Vz0TQSwVK4Fv13f3J9NJLtBe4UP2f14=";
  #   persistencedSha256 = "sha256-QCwxXQfG/Pa7jSTBB0xD3lsIofcerAWWAHKvWjWGQtg=";
  # };
  # package = config.boot.kernelPackages.nvidiaPackages.latest;
  package =
    let
      base = config.boot.kernelPackages.nvidiaPackages.latest;
      cachyos-nvidia-patch = pkgs.fetchpatch {
        url = "https://raw.githubusercontent.com/CachyOS/CachyOS-PKGBUILDS/master/nvidia/nvidia-utils/kernel-6.19.patch";
        sha256 = "sha256-YuJjSUXE6jYSuZySYGnWSNG5sfVei7vvxDcHx3K+IN4=";
      };

      # Patch the appropriate driver based on config.hardware.nvidia.open
      driverAttr = if config.hardware.nvidia.open then "open" else "bin";
    in
    base
    // {
      ${driverAttr} = base.${driverAttr}.overrideAttrs (oldAttrs: {
        patches = (oldAttrs.patches or [ ]) ++ [ cachyos-nvidia-patch ];
      });
    };
in
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD VA-API
      nvidia-vaapi-driver
      mangohud
    ];
    extraPackages32 = with pkgs; [
      mangohud
    ];
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    dynamicBoost.enable = true;
    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Assuming Intel is the primary GPU and Nvidia is for offload
      intelBusId = "PCI:0:2:0"; # Matches your lspci output
      nvidiaBusId = "PCI:1:0:0"; # Matches your lspci output
    };

    nvidiaPersistenced = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    open = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.

    # Optionally, you may need to select the appropriate driver version for your specific GPU.

    package = package;
  };
}
