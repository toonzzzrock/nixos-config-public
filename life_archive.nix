{ pkgs, ... }:

{
  systemd.user.services.life_archive = {
    description = "Life Archive Service";
    path = [
      pkgs.grim
      pkgs.bash
      pkgs.hyprland
      pkgs.jq
      pkgs.dbus
    ];
    wantedBy = [ "default.target" ];
    enable = true;
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/etc/profiles/per-user/toonzzzrock/bin/life_archive";
      WorkingDirectory = "/home/toonzzzrock/Pictures/LifeArchive";
    };
    partOf = [ "graphical-session.target" ];
  };

  # 60 years * 242 days * 24 hours * 12 (60/5) minutes = 1_742_400 minutes
  # 1_742_400 times * 2 MiB (per image) / 1024 (Mb) / 1024 (Gb) = 3.33 TB
  # 3.33 TB / 60 years = 55.5 GB per year
  systemd.user.timers.life_archive = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*:0/5"; # every 10 minutes
      Persistent = true;
    };
  };
}
