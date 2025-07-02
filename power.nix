{ config, inputs, pkgs, ... }:
{

    powerManagement = {
        enable = true;
        # cpuFreqGovernor = "powersave"; # Set to powersave for both AC and battery
        powertop.enable = true;
        # cpuFreqGovernor is now managed by TLP
    };
    
    services = {
        thermald.enable = true;
        system76-scheduler = {
            enable = false;
            useStockConfig = true;
        };

        auto-cpufreq = {
            enable = false; # Disabled to avoid conflict with TLP
            settings = {
                battery = {
                    governor = "powersave";
                    turbo = "never";
                };
                charger = {
                    governor = "performance";
                    turbo = "auto";
                };
            };
        };
        
        power-profiles-daemon.enable = false; # Remains disabled as per original

        tlp = {
            enable = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                # auto-cpufreq battery: turbo = "never"
                # auto-cpufreq charger: turbo = "auto"
                CPU_BOOST_ON_AC = "1"; # Enables turbo on AC
                CPU_BOOST_ON_BAT = "0"; # Disables turbo on battery
            };
        };
    };
}