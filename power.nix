{
  pkgs,
  lib,
  ...
}:
{
  powerManagement = {
    enable = true;
    powertop.enable = lib.mkForce false;
    # cpuFreqGovernor = "schedutil"; # power, performance, ondemand
  };

  services = {
    system76-scheduler = {
      enable = false;
      useStockConfig = false;
    };
    power-profiles-daemon.enable = lib.mkForce false; # Remains disabled as per original

    tlp = {
      enable = true;
      settings = {
        ##### CPU #####
        RUNTIME_PM_DRIVER_DENYLIST = "mei_me";

        # Governors
        CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; # schedutil

        # Energy/Perf policy (EPP)
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; # gentler but still snappy

        # intel_pstate/amd-pstate opmode
        CPU_DRIVER_OPMODE_ON_AC = "passive";
        CPU_DRIVER_OPMODE_ON_BAT = "passive";

        # Perf caps (percent of max p‑state)
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50; # tighter cap for better battery

        # Boost
        CPU_BOOST_ON_AC = 0;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        ##### Platform / PCIe / Runtime PM #####
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "default";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        ##### Storage #####
        # SATA link power (safe sweet spot)
        SATA_LINKPWR_ON_AC = "med_power_with_dipm";
        SATA_LINKPWR_ON_BAT = "med_power_with_dipm";
        AHCI_RUNTIME_PM_ON_AC = "auto";
        AHCI_RUNTIME_PM_ON_BAT = "auto";
        AHCI_RUNTIME_PM_TIMEOUT = 15;

        ##### Wi‑Fi #####
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on"; # flip to "off" if unstable or too slow

        ##### USB autosuspend #####
        USB_AUTOSUSPEND = 1;
        # Example: exclude a flaky device (vendor:product)
        # USB_DENYLIST = "0bda:8153";

        # Intel iGPU (prefer defaults on BAT for smoother bursts)
        INTEL_GPU_MIN_FREQ_ON_AC = 400;
        INTEL_GPU_MIN_FREQ_ON_BAT = 200;
        INTEL_GPU_MAX_FREQ_ON_AC = 1450;
        INTEL_GPU_MAX_FREQ_ON_BAT = 800;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1450;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 800;

        ##### Audio #####
        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;

        ##### Misc #####
        MEM_SLEEP_ON_AC = "deep";
        MEM_SLEEP_ON_BAT = "deep";
        NMI_WATCHDOG = 0;
        RESTORE_DEVICE_STATE_ON_STARTUP = 1;
      };
    };
  };
}
