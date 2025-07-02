{ config, inputs, pkgs, ... }: let 
    # package =  (pkgs.linuxPackages_cachyos.nvidia_x11 // {
    #       # Add missing attribute expected by the NixOS nvidia module.
    #       # Set to false as a safe default. Change to true if application
    #       # profiles are supported and desired for this driver package.
    #       useProfiles = true;
    #     });
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #         version = "570.153.02";
    #         sha256_64bit = "sha256-FIiG5PaVdvqPpnFA5uXdblH5Cy7HSmXxp6czTfpd4bY=";
    #         sha256_aarch64 = "sha256-FKhtEVChfw/1sV5FlFVmia/kE1HbahDJaxTlpNETlrA=";
    #         openSha256 = "sha256-2DpY3rgQjYFuPfTY4U/5TcrvNqsWWnsOSX0f2TfVgTs=";
    #         settingsSha256 = "sha256-5m6caud68Owy4WNqxlIQPXgEmbTe4kZV2vZyTWHWe+M=";
    #         persistencedSha256 = "sha256-OSo4Od7NmezRdGm7BLLzYseWABwNGdsomBCkOsNvOxA=";
    #         patchesOpen = [
    #             # ./nvidia-patch4.patch
    #             # ./nvidia-patch.patch
    #             # ./nvidia-patch2.patch
    #             # ./nvidia-patch3.patch
    #         ];
    #     };   
    gpl_symbols_linux_615_patch = pkgs.fetchpatch {
        url = "https://github.com/CachyOS/kernel-patches/raw/914aea4298e3744beddad09f3d2773d71839b182/6.15/misc/nvidia/0003-Workaround-nv_vm_flags_-calling-GPL-only-code.patch";
        hash = "sha256-YOTAvONchPPSVDP9eJ9236pAPtxYK5nAePNtm2dlvb4=";
        stripLen = 1;
        extraPrefix = "kernel/";
    };
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "575.57.08";
        sha256_64bit = "sha256-KqcB2sGAp7IKbleMzNkB3tjUTlfWBYDwj50o3R//xvI=";
        sha256_aarch64 = "sha256-VJ5z5PdAL2YnXuZltuOirl179XKWt0O4JNcT8gUgO98=";
        openSha256 = "sha256-DOJw73sjhQoy+5R0GHGnUddE6xaXb/z/Ihq3BKBf+lg=";
        settingsSha256 = "sha256-AIeeDXFEo9VEKCgXnY3QvrW5iWZeIVg4LBCeRtMs5Io=";
        persistencedSha256 = "sha256-Len7Va4HYp5r3wMpAhL4VsPu5S0JOshPFywbO7vYnGo=";
        patches = [
            gpl_symbols_linux_615_patch
        ];
    };
    # package = config.boot.kernelPackages.nvidiaPasckages.stable;

in { 
    # nixpkgs.config.packageOverrides = pkgs: {
    #     intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
    # };
    # hardware.intelgpu.vaapiDriver = "intel-media-driver";
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            intel-media-driver # LIBVA_DRIVER_NAME=iHD
        ];
	};

    hardware.nvidia = {

        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
        # of just the bare essentials.
        powerManagement.enable = true;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = true;

        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };

            # Assuming Intel is the primary GPU and Nvidia is for offload
            intelBusId = "PCI:0:2:0"; # Matches your lspci output
            nvidiaBusId = "PCI:1:0:0"; # Matches your lspci output
        };


        dynamicBoost.enable = true; # Dynamic Boost

        nvidiaPersistenced = true;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of
        # supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        # Only available from driver 515.43.04+
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = false;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        
        # package = config.boot.kernelPackages.nvidiaPackages.beta;
        # package = pkgs.nvidia-patch.patch-nvenc (pkgs.nvidia-patch.patch-fbc package);
        package = package;
    };

    services.xserver.videoDrivers = [ "nvidia" "modesetting"];
    # services.xserver.videoDrivers = [ "intel"];
}
