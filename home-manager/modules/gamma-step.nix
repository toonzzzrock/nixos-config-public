{
  # https://github.com/nix-community/home-manager/blob/master/modules/services/redshift-gammastep/lib/options.nix
  services.gammastep = {
    enable = true;
    # provider = "manual";
    # latitude = 13.74998;
    # longitude = 100.51682;
    dawnTime = "8:45-9:00";
    duskTime = "22:00-22:15";
    temperature = {
      day = 5500;
      night = 2500;
    };
  };
}
